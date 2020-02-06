import { eventBus } from "./plugins/eventBus";
import { useMetricService } from "./services/metricService";
import { Metric, availableMetrics, MetricController } from "./types/metrics";
import { FetchService } from "./types/services";
import { Ref } from "@vue/composition-api";
import { getMetadata } from "./meta/metrics";

type Interval = {
  id: number | undefined;
  runningState: boolean;
  time: number;
};

export function useMetricController(): MetricController {
  eventBus.$on("METRICS_CHANGED", (payload: Metric[]) => {
    stop();
    start(payload);
  });

  const metricServices: Record<Metric, FetchService> = setup();

  const metricIntervals: Record<Metric, Interval> = {
    access: getInitialInterval(5000),
    cpu: getInitialInterval(1000),
    latency: getInitialInterval(1000),
    executedQueryTypeProportion: getInitialInterval(1000),
    generatedQueryTypeProportion: getInitialInterval(1000),
    queueLength: getInitialInterval(1000),
    ram: getInitialInterval(1000),
    storage: getInitialInterval(5000),
    throughput: getInitialInterval(1000)
  };

  const data: Record<Metric, Ref<any>> = mapToData(metricServices);

  function setup(): Record<Metric, FetchService> {
    const services: any = {};
    availableMetrics.forEach(metric => {
      services[metric] = useMetricService(getMetadata(metric));
    });
    return services;
  }

  function start(metrics: Metric[]): void {
    metrics.forEach(metric => {
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

  function getInitialInterval(time: number): Interval {
    return { id: undefined, runningState: false, time };
  }

  function mapToData(
    services: Record<Metric, FetchService>
  ): Record<Metric, Ref<any>> {
    const data: any = {};
    Object.entries(services).forEach(entry => {
      data[entry[0] as Metric] = entry[1].data;
    });
    return data;
  }

  return { data };
}
