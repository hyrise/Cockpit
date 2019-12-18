import { Ref, ref } from "@vue/composition-api";
import { Database } from "../types/database";
import axios from "axios";
import colors from "vuetify/lib/util/colors";

export function useDatabaseFetchService(): {
  databases: Ref<Database[]>;
  addDatabase: (databasedata: any) => void;
} {
  const colorsArray = Object.keys(colors);
  let usedColors = 0;
  const databases = ref<Database[]>([]);

  function getDatabases(): void {
    axios.get("http://vm-aurora.eaalab.hpi.uni-potsdam.de:8000/database").then(
      response =>
        (databases.value = response.data.body.databases.map(database => ({
          id: database,
          color: getDatabaseColor()
        })))
    );
  }

  getDatabases();

  function getDatabaseColor(): string {
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
                color: getDatabaseColor()
              })))
          );
        console.log(response);
      })
      .catch(error => {
        console.log(error);
      });
  }

  function getDummyDatabases(): Database[] {
    return [{ id: "citadelle", color: getDatabaseColor() }];
  }

  return {
    databases,
    addDatabase
  };
}
