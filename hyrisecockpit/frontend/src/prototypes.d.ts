import Vue from "vue";
import { DatabaseController } from "./types/database";
import { MetricController } from "./types/metrics";

declare module "vue/types/vue" {
  interface Vue {
    $databaseController: DatabaseController;
    $metricController: MetricController;
  }
}
