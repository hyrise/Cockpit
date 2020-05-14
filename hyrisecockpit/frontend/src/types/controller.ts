import { PageName } from "@/types/views";
import { Metric } from "@/types/metrics";
import { Ref } from "@vue/composition-api";
import { Database } from "@/types/database";
import { StaticRange } from "@/controller/selectionController";

export interface SelectionController {
  pageDatabases: Record<PageName, string[]>;
  availableMetrics: Record<PageName, Metric[]>;
  pageMetrics: Record<PageName, Metric[]>;
  selectedRange: Ref<number>;
  selectedPrecision: Ref<number>;
  selectedMetrics: Ref<readonly Metric[]>;
  selectedDatabases: Ref<readonly string[]>;
  selectedStaticRange: Ref<StaticRange | null>;
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

export interface PluginController {
  availablePlugins: Ref<string[]>;
  activePlugins: Ref<string[]>;
  pluginLogs: Ref<any>;
  pluginSettings: Ref<any>;
  pluginEventData: Ref<any>;
  changePluginSetting: (
    databaseId: string,
    settingId: string,
    settingValue: string
  ) => Promise<void>;
  changePlugin: (databaseId: string, plugin: string) => Promise<void>;
  isActivated: (databaseId: string, plugin: string) => boolean;
}
