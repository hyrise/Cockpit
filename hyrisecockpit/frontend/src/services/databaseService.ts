import { Ref, ref } from "@vue/composition-api";
import { Database } from "../types/database";
import axios from "axios";
import colors from "vuetify/lib/util/colors";

export function useDatabaseFetchService(): {
  databases: Ref<Database[]>;
  addDatabase: (databasedata: any) => void;
  isReady: Ref<boolean>;
} {
  const colorsArray = Object.keys(colors);
  let usedColors = 0;
  const databases = ref<Database[]>([]);
  let isReady = ref<boolean>(false);

  function getDatabases(): void {
    axios
      .get("http://vm-aurora.eaalab.hpi.uni-potsdam.de:8000/database")
      .then(response => {
        databases.value = response.data.body.databases.map(database => ({
          id: database,
          color: getDatabaseColor(database)
        }));
        isReady.value = true;
      });
  }

  getDatabases();

  function getDatabaseColor(id: string): string {
    const database =
      databases && databases.value.find(database => database.id === id);
    if (database) {
      return database.color;
    }
    const color: any = colors[colorsArray[usedColors]].base;
    usedColors += 2;
    return color;
  }

  function addDatabase(databaseData: any): void {
    axios
      .post(
        "http://vm-aurora.eaalab.hpi.uni-potsdam.de:8000/database",
        databaseData
      )
      .then(response => {
        axios
          .get("http://vm-aurora.eaalab.hpi.uni-potsdam.de:8000/database")
          .then(
            result =>
              (databases.value = result.data.body.databases.map(database => ({
                id: database,
                color: getDatabaseColor(database)
              })))
          );
      })
      .catch(error => {
        console.log(error);
      });
  }

  return {
    databases,
    addDatabase,
    isReady
  };
}
