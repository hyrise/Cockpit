import {
  SelectionController,
  MetricController,
  DatabaseController,
  PluginController,
} from "@/types/controller";

declare module "vue/types/vue" {
  interface Vue {
    $databaseController: DatabaseController;
    $metricController: MetricController;
    $pluginController: PluginController;
    $selectionController: SelectionController;
  }
}
