import { Ref, ref } from "@vue/composition-api";
import { Database, DatabaseData } from "../types/database";
import axios from "axios";
import colors from "vuetify/lib/util/colors";

export function useDatabaseFetchService(): DatabaseData {
  const colorsArray: any = Object.keys(colors);
  let usedColors: any = 0;
  const databases = ref<Database[]>([]);
  const isReady = ref<boolean>(false);
  const tables = ref<string[]>([]);

  function getTables(): void {
    axios
      .get("http://vm-aurora.eaalab.hpi.uni-potsdam.de:8000/storage")
      .then(result => {
        const instance = Object.keys(result.data.body.storage)[0];
        tables.value = Object.keys(result.data.body.storage[instance]);
      });
  }

  function getDatabases(): void {
    axios
      .get("http://vm-aurora.eaalab.hpi.uni-potsdam.de:8000/database")
      .then(response => {
        databases.value = response.data.body.databases.map((database: any) => ({
          id: database,
          color: getDatabaseColor(database)
        }));
        isReady.value = true;
      });
  }

  getDatabases();
  getTables();

  function getDatabaseColor(id: string): string {
    const database =
      databases && databases.value.find(database => database.id === id);
    if (database) {
      return database.color;
    }
    const color: any = (colors as any)[colorsArray[usedColors]].base;
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
              (databases.value = result.data.body.databases.map(
                (database: any) => ({
                  id: database,
                  color: getDatabaseColor(database)
                })
              ))
          );
      })
      .catch(error => {
        console.log(error);
      });
  }

  return {
    databases,
    addDatabase,
    isReady,
    tables
  };
}
