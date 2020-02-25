import { eventBus } from "../plugins/eventBus";
import { Metric } from "@/types/metrics";
import { Database } from "@/types/database";

export function useMetricEvents(): {
  emitWatchedMetricsChangedEvent: (metrics?: Metric[]) => void;
  emitSelectedMetricsChangedEvent: (metrics?: Metric[]) => void;
} {
  function emitWatchedMetricsChangedEvent(metrics: Metric[] = []): void {
    eventBus.$emit("WATCHED_METRICS_CHANGED", metrics);
  }
  function emitSelectedMetricsChangedEvent(metrics: Metric[] = []): void {
    eventBus.$emit("SELECTED_METRICS_CHANGED", metrics);
  }
  return { emitWatchedMetricsChangedEvent, emitSelectedMetricsChangedEvent };
}

export function useDatabaseEvents(): {
  emitSelectedDatabasesChangedEvent: (databases?: Database[]) => void;
} {
  function emitSelectedDatabasesChangedEvent(databases: Database[] = []): void {
    eventBus.$emit("SELECTED_DATABASES_CHANGED", databases);
  }
  return { emitSelectedDatabasesChangedEvent };
}
