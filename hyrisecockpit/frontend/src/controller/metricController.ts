import { eventBus } from "@/plugins/eventBus";
import { computed, watch } from "@vue/composition-api";
import { useMetricService } from "@/services/metricService";
import { Metric, availableMetrics, MetricController } from "@/types/metrics";
import { MetricService } from "@/types/services";
import { getMetricRequestTime } from "@/meta/metrics";
import { useFormatting } from "@/meta/formatting";

type Interval = {
  id: number | undefined;
  runningState: boolean;
  time: number;
};

export function useMetricController(): MetricController {
  const { subSeconds } = useFormatting();

  eventBus.$on("WATCHED_METRICS_CHANGED", (payload: Metric[]) => {
    stop();
    start(payload || []);
  });

  eventBus.$on("PAGE_CHANGED", (payload: Metric[]) => {
    const currentDate = new Date();
    stop();
    start(payload || [], new Date(subSeconds(currentDate, 30)), currentDate);
  });

  eventBus.$on(
    "HISTORIC_RANGE_CHANGED",
    (payload: { metrics: Metric[]; start: Date; end: Date }) => {
      stop();
      start(payload.metrics || [], payload.start, payload.end); //TODO: fire only once when watching historic data
    }
  );

  const metricServices = setupServices();

  const metricIntervals = setupIntervals();

  let data = {} as any;
  let maxValueData = {} as any;
  let timestamps = {} as any;

  mapToData(metricServices);

  function setupServices(): Record<Metric, MetricService> {
    const services: any = {};
    availableMetrics.forEach(metric => {
      services[metric] = useMetricService([metric]);
    });
    return services;
  }

  function setupIntervals(): Record<Metric, Interval> {
    const intervals: any = {};
    availableMetrics.forEach(metric => {
      intervals[metric] = {
        id: undefined,
        runningState: false,
        time: getMetricRequestTime(metric)
      };
    });
    return intervals;
  }

  function start(metrics: Metric[], start?: Date, end?: Date): void {
    metrics.forEach(metric => {
      metricServices[metric].getDataIfReady(start, end);
      metricIntervals[metric].id = setInterval(
        metricServices[metric].getDataIfReady,
        metricIntervals[metric].time
      );
      metricIntervals[metric].runningState = true;
    });
  }

  function stop(): void {
    const runningIntervals = Object.values(metricIntervals).filter(
      interval => interval.runningState == true
    );
    runningIntervals.forEach(interval => {
      clearInterval(interval.id);
      interval.id = undefined;
      interval.runningState = false;
    });
  }

  watch(
    () => data["cpu"],
    () => {
      console.log("cpu", data["cpu"]);
    }
  );

  function mapToData(services: Record<Metric, MetricService>): void {
    Object.entries(services).forEach(([metric, service]) => {
      console.log(metric, service.maxValues.value[metric]);
      data[metric as Metric] = computed(() => service.data[metric]);
      maxValueData[metric as Metric] = computed(
        () => service.maxValues.value[metric as Metric]
      );
      timestamps[metric as Metric] = service.timestamps;
    });
  }

  return { data, maxValueData, timestamps };
}
