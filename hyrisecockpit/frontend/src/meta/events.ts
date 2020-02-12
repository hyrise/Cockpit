import { eventBus } from "../plugins/eventBus";
import { Metric } from "@/types/metrics";

export function useMetricEvents(): {
  throwMetricsChangedEvent: (metrics?: Metric[]) => void;
} {
  function throwMetricsChangedEvent(metrics: Metric[] = []): void {
    eventBus.$emit("METRICS_CHANGED", metrics);
  }
  return { throwMetricsChangedEvent };
}
