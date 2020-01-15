import Vue from "vue";
import { DatabaseData } from "./types/database";

declare module "vue/types/vue" {
  interface Vue {
    $databaseData: DatabaseData;
  }
}
