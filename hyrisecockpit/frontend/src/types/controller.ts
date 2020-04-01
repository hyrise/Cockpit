import { PageName } from "@/types/views";
import { Metric } from "@/types/metrics";

export interface SelectionController {
  selectedDatabases: Record<PageName, string[]>;
  availableMetrics: Record<PageName, Metric[]>;
  selectedMetrics: Record<PageName, Metric[]>;
}
