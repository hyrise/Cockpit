import { eventBus } from "@/plugins/eventBus";
import { Metric } from "@/types/metrics";
import { PageName } from "@/types/views";
import { SetupContext } from "@vue/composition-api";

export function useMetricEvents(): {
  emitWatchedMetricsChangedEvent: (metrics: Metric[]) => void;
  emitSelectedMetricsChangedEvent: () => void;
  emitSelectedMetricsChangedWithinEvent: (
    page: PageName,
    metric: Metric,
    value: boolean
  ) => void;
} {
  function emitWatchedMetricsChangedEvent(metrics: Metric[]): void {
    eventBus.$emit("WATCHED_METRICS_CHANGED", metrics);
  }
  function emitSelectedMetricsChangedEvent(): void {
    eventBus.$emit("SELECTED_METRICS_CHANGED");
  }
  function emitSelectedMetricsChangedWithinEvent(
    page: PageName,
    metric: Metric,
    value: boolean
  ): void {
    emitSelectedMetricsChangedEvent();
    eventBus.$emit(`SELECTED_METRICS_CHANGED_ON_${page.toUpperCase()}`, {
      metric,
      value,
    });
  }
  return {
    emitWatchedMetricsChangedEvent,
    emitSelectedMetricsChangedEvent,
    emitSelectedMetricsChangedWithinEvent,
  };
}

export function useWindowEvents(): {
  emitPageChangedEvent: (metrics: Metric[], newRange: number) => void;
  emitHistoricRangeChangedEvent: (
    metrics: Metric[],
    newHistoricalRangeMinutes: number
  ) => void;
  emitPrecisionChangedEvent: (
    metrics: Metric[],
    newHistoricalRangeMinutes: number
  ) => void;
} {
  function emitPageChangedEvent(metrics: Metric[], newRange: number): void {
    eventBus.$emit("PAGE_CHANGED", {
      metrics,
      newRange,
    });
  }
  function emitHistoricRangeChangedEvent(
    metrics: Metric[],
    newRange: number
  ): void {
    eventBus.$emit("HISTORIC_RANGE_CHANGED", {
      metrics,
      newRange,
    });
  }

  function emitPrecisionChangedEvent(
    metrics: Metric[],
    newRange: number
  ): void {
    eventBus.$emit("PRECISION_CHANGED", {
      metrics,
      newRange,
    });
  }

  return {
    emitPageChangedEvent,
    emitHistoricRangeChangedEvent,
    emitPrecisionChangedEvent,
  };
}

export function useDatabaseEvents(): {
  emitSelectedDatabasesChangedEvent: (databases?: string[]) => void;
  emitDatabaseAddedEvent: () => void;
  emitDatabaseRemovedEvent: () => void;
  emitSelectedDatabasesChangedWithinEvent: (
    page: PageName,
    database: string,
    value: boolean
  ) => void;
} {
  function emitSelectedDatabasesChangedEvent(): void {
    eventBus.$emit("SELECTED_DATABASES_CHANGED");
  }
  function emitSelectedDatabasesChangedWithinEvent(
    page: PageName,
    database: string,
    value: boolean
  ): void {
    emitSelectedDatabasesChangedEvent();
    eventBus.$emit(`SELECTED_DATABASES_CHANGED_ON_${page.toUpperCase()}`, {
      database,
      value,
    });
  }
  function emitDatabaseAddedEvent(): void {
    eventBus.$emit("DATABASE_ADDED");
  }
  function emitDatabaseRemovedEvent(): void {
    eventBus.$emit("DATABASE_REMOVED");
  }
  return {
    emitSelectedDatabasesChangedEvent,
    emitSelectedDatabasesChangedWithinEvent,
    emitDatabaseAddedEvent,
    emitDatabaseRemovedEvent,
  };
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
