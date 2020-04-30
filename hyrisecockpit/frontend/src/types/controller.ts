import { PageName } from "@/types/views";
import { Metric } from "@/types/metrics";
import { Ref } from "@vue/composition-api";
import { Database } from "@/types/database";

export interface SelectionController {
  pageDatabases: Record<PageName, string[]>;
  availableMetrics: Record<PageName, Metric[]>;
  pageMetrics: Record<PageName, Metric[]>;
  selectedRange: Ref<number>;
  selectedPrecision: Ref<number>;
  selectedMetrics: Ref<readonly Metric[]>;
  selectedDatabases: Ref<readonly string[]>;
}

export interface MetricController {
  data: Record<Metric, Ref<any>>;
  maxValueData: Record<Metric, Ref<number>>;
  timestamps: Record<Metric, Ref<Date[]>>;
}

export interface DatabaseController {
  databasesUpdated: Ref<boolean>;
  availableDatabasesById: Ref<readonly string[]>;
  getDatabasesByIds: (ids: string[]) => Database[];
  getDatabaseById: (id: string) => Database;
}
