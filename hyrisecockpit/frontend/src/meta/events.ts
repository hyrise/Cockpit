import { eventBus } from "../plugins/eventBus";
import { Metric } from "@/types/metrics";

export function useMetricEvents(): {
  emitMetricsChangedEvent: (metrics?: Metric[]) => void;
} {
  function emitMetricsChangedEvent(metrics: Metric[] = []): void {
    eventBus.$emit("METRICS_CHANGED", metrics);
  }
  return { emitMetricsChangedEvent };
}
