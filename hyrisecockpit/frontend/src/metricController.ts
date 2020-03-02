import { eventBus } from "./plugins/eventBus";
import { useMetricService } from "./services/metricService";
import { Metric, availableMetrics, MetricController } from "./types/metrics";
import { MetricService } from "./types/services";
import { getMetricRequestTime } from "./meta/metrics";

type Interval = {
  id: number | undefined;
  runningState: boolean;
  time: number;
};

export function useMetricController(): MetricController {
  eventBus.$on("WATCHED_METRICS_CHANGED", (payload: Metric[]) => {
    stop();
    start(payload);
  });

  const metricServices = setupServices();

  const metricIntervals = setupIntervals();

  let data = {} as any;
  let maxValueData = {} as any;
  let timestamps = {} as any;

  mapToData(metricServices);

  function setupServices(): Record<Metric, MetricService> {
    const services: any = {};
    availableMetrics.forEach(metric => {
      services[metric] = useMetricService(metric);
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

  function start(metrics: Metric[]): void {
    metrics.forEach(metric => {
      metricServices[metric].getDataIfReady,
        (metricIntervals[metric].id = setInterval(
          metricServices[metric].getDataIfReady,
          metricIntervals[metric].time
        ));
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

  function mapToData(services: Record<Metric, MetricService>): void {
    Object.entries(services).forEach(([metric, service]) => {
      data[metric as Metric] = service.data;
      maxValueData[metric as Metric] = service.maxValue;
      timestamps[metric as Metric] = service.timestamps;
    });
  }

  return { data, maxValueData, timestamps };
}
