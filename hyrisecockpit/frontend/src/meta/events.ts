import { eventBus } from "@/plugins/eventBus";
import { Metric } from "@/types/metrics";
import { PageName } from "@/types/views";

export function useMetricEvents(): {
  emitSelectedMetricsChangedEvent: () => void;
  emitSelectedMetricsChangedWithinEvent: (
    page: PageName,
    metric: Metric,
    value: boolean
  ) => void;
} {
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
    emitSelectedMetricsChangedEvent,
    emitSelectedMetricsChangedWithinEvent,
  };
}

export function useWindowEvents(): {
  emitPageChangedEvent: (page: PageName) => void;
} {
  function emitPageChangedEvent(page: PageName): void {
    eventBus.$emit("PAGE_CHANGED", page);
  }

  return {
    emitPageChangedEvent,
  };
}

export function useDatabaseEvents(): {
  emitSelectedDatabasesChangedEvent: (databases?: string[]) => void;
  emitDatabaseAddedEvent: () => void;
  emitDatabaseRemovedEvent: () => void;
  emitDatabaseStatusChangedEvent: (
    databaseId: string,
    blocked: boolean,
    active: boolean
  ) => void;
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
  function emitDatabaseStatusChangedEvent(
    databaseId: string,
    blocked: boolean,
    active: boolean
  ): void {
    eventBus.$emit("DATABASE_STATUS_CHANGED", databaseId, blocked, active);
  }
  return {
    emitSelectedDatabasesChangedEvent,
    emitSelectedDatabasesChangedWithinEvent,
    emitDatabaseAddedEvent,
    emitDatabaseRemovedEvent,
    emitDatabaseStatusChangedEvent,
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
