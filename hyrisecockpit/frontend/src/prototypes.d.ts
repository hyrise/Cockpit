import { PluginService } from "./types/services";
import {
  SelectionController,
  MetricController,
  DatabaseController,
} from "@/types/controller";

declare module "vue/types/vue" {
  interface Vue {
    $databaseController: DatabaseController;
    $metricController: MetricController;
    $pluginService: PluginService;
    $selectionController: SelectionController;
  }
}
