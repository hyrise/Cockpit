import { eventBus } from "../plugins/eventBus";
import { Metric } from "@/types/metrics";

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
  emitSelectedDatabasesChangedEvent: (databases?: string[]) => void;
  emitDatabaseAddedEvent: () => void;
} {
  function emitSelectedDatabasesChangedEvent(databases: string[] = []): void {
    eventBus.$emit("SELECTED_DATABASES_CHANGED", databases);
  }
  function emitDatabaseAddedEvent(): void {
    eventBus.$emit("DATABASE_ADDED");
  }
  return { emitSelectedDatabasesChangedEvent, emitDatabaseAddedEvent };
}

export function useDataEvents(): {
  emitStorageDataChangedEvent: (data: any) => void;
  emitCPUDataChangedEvent: (data: any) => void;
} {
  function emitStorageDataChangedEvent(data: any): void {
    eventBus.$emit("STORAGE_DATA_CHANGED", data);
  }
  function emitCPUDataChangedEvent(data: any): void {
    eventBus.$emit("CPU_DATA_CHANGED", data);
  }
  return { emitCPUDataChangedEvent, emitStorageDataChangedEvent };
}
