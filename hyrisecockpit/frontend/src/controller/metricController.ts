import { computed, watch } from "@vue/composition-api";
import { useMetricService } from "@/services/metricService";
import { Metric, availableMetrics } from "@/types/metrics";
import { MetricService } from "@/types/services";
import { MetricController } from "@/types/controller";
import { getMetricRequestTime, getMetricMetadata } from "@/meta/metrics";
import Vue from "vue";
import { StaticRange } from "@/controller/selectionController";

type Interval = {
  id: number | undefined;
  runningState: boolean;
  time: number;
};

export function useMetricController(): MetricController {
  /* current selected data */
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

  /* ensure valid time range */
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
    if (validTime.value && !selectedStaticRange.value)
      start(selectedMetrics.value as Metric[]);
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

  // initialize metric services
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

  /** combines metrics with same endpoint */
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

  // initialize intervals
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

  /** starts requesting metric data */
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

  /** stops requesting metric data */
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

  /** requests metric data once */
  function startOnce(newMetrics: Metric[]): void {
    getMetricsByEndpoint(newMetrics).forEach((metrics) => {
      const metric = metrics[0];
      metricServices[metric].getDataIfReady(true, true);
    });
  }

  /** exports necessary data */
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
