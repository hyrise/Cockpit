import { PageName } from "@/types/views";
import { Metric } from "@/types/metrics";
import { Ref } from "@vue/composition-api";

export interface SelectionController {
  selectedDatabases: Record<PageName, string[]>;
  availableMetrics: Record<PageName, Metric[]>;
  selectedMetrics: Record<PageName, Metric[]>;
  selectedRange: Ref<number>;
  selectedPrecision: Ref<number>;
}
