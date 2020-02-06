import Vue from "vue";
import { DatabaseData } from "./types/database";
import { MetricController } from "./types/metrics";

declare module "vue/types/vue" {
  interface Vue {
    $databaseData: DatabaseData;
    $metricController: MetricController;
  }
}
