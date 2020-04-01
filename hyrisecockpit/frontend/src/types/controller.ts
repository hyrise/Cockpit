import { PageName } from "@/types/views";

export interface SelectionController {
  selectedDatabases: Record<PageName, string[]>;
}
