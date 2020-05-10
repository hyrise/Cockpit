import { computed, watch } from "@vue/composition-api";
import { useMetricService } from "@/services/metricService";
import { Metric, availableMetrics } from "@/types/metrics";
import { MetricService } from "@/types/services";
import { MetricController } from "@/types/controller";
import { getMetricRequestTime, getMetricMetadata } from "@/meta/metrics";
import Vue from "vue";
import { eventBus } from "@/plugins/eventBus";
import { StaticRange } from "@/controller/selectionController";

type Interval = {
  id: number | undefined;
  runningState: boolean;
  time: number;
};

export function useMetricController(): MetricController {
  const precision = computed(
    (): number => Vue.prototype.$selectionController.selectedPrecision.value
  );
  const range = computed(
    (): number => Vue.prototype.$selectionController.selectedRange.value
  );
  const selectedMetrics = computed(
    (): Metric[] => Vue.prototype.$selectionController.selectedMetrics.value
  );
  const selectedStaticRange = computed(
    (): StaticRange | null =>
      Vue.prototype.$selectionController.selectedStaticRange.value
  );

  const validTime = computed(
    () => precision.value < range.value && precision.value >= range.value / 60
  );

  const metricServices = setupServices();

  const metricIntervals = setupIntervals();

  let data = {} as any;
  let maxValueData = {} as any;
  let timestamps = {} as any;

  mapToData(metricServices);

  /* restart requests on change */
  watch([precision, range, selectedMetrics], () => {
    stop();
    if (validTime.value) start(selectedMetrics.value as Metric[]);
  });

  /* request once on static time range, restart if not present */
  watch(selectedStaticRange, () => {
    stop();
    if (!!selectedStaticRange.value) {
      startOnce(selectedMetrics.value as Metric[]);
    } else {
      start(selectedMetrics.value as Metric[]);
    }
  });

  function setupServices(): Record<Metric, MetricService> {
    const services: any = {};
    getMetricsByEndpoint(availableMetrics).forEach((metrics) => {
      const metricService = useMetricService(metrics);
      metrics.forEach((metric) => {
        services[metric] = metricService;
      });
    });
    return services;
  }

  function getMetricsByEndpoint(newMetrics: Metric[]): Metric[][] {
    return newMetrics.reduce(
      (metricsByEndpoint: Metric[][], metric: Metric) => {
        const correspondingMetrics = metricsByEndpoint.find((metrics) =>
          metrics
            .map((detectedMetric) => getMetricMetadata(detectedMetric).endpoint)
            .includes(getMetricMetadata(metric).endpoint)
        );
        if (correspondingMetrics) {
          correspondingMetrics.push(metric);
        } else {
          metricsByEndpoint.push([metric]);
        }
        return metricsByEndpoint;
      },
      [] as Metric[][]
    );
  }

  function setupIntervals(): Record<Metric, Interval> {
    const intervals: any = {};
    availableMetrics.forEach((metric) => {
      intervals[metric] = {
        id: undefined,
        runningState: false,
        time: getMetricRequestTime(metric),
      };
    });
    return intervals;
  }

  function start(newMetrics: Metric[]): void {
    getMetricsByEndpoint(newMetrics).forEach((metrics) => {
      const metric = metrics[0];
      metricServices[metric].getDataIfReady(true);
      metricIntervals[metric].id = setInterval(
        metricServices[metric].getDataIfReady,
        Math.max(metricIntervals[metric].time, precision.value * 1000)
      );
      metricIntervals[metric].runningState = true;
    });
  }

  function stop(): void {
    const runningIntervals = Object.values(metricIntervals).filter(
      (interval) => interval.runningState == true
    );
    runningIntervals.forEach((interval) => {
      clearInterval(interval.id);
      interval.id = undefined;
      interval.runningState = false;
    });
  }

  function startOnce(newMetrics: Metric[]): void {
    getMetricsByEndpoint(newMetrics).forEach((metrics) => {
      const metric = metrics[0];
      metricServices[metric].getDataIfReady(true);
    });
  }

  function mapToData(services: Record<Metric, MetricService>): void {
    Object.entries(services).forEach(([metric, service]) => {
      data[metric as Metric] = computed(() => service.data[metric]);
      maxValueData[metric as Metric] = computed(
        () => service.maxValues[metric as Metric]
      );
      timestamps[metric as Metric] = service.timestamps;
    });
  }

  return { data, maxValueData, timestamps };
}
