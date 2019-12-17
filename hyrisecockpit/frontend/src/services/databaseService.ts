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
  const databases = ref<Database[]>(getDummyDatabases());

  function getDatabases(): void {
    axios
      .get("http://vm-aurora.eaalab.hpi.uni-potsdam.de:8000/drivers")
      .then(response => {
        return response.data.body.ids.map(database => ({
          id: database
        }));
      });
  }

  function getDatabaseColor(): string {
    const color: any = colors[colorsArray[usedColors]].base;
    usedColors += 2;
    return color;
  }

  function addDatabase(databaseData: any): void {
    axios
      .post(
        "http://vm-aurora.eaalab.hpi.uni-potsdam.de:5000/database",
        databaseData
      )
      .then(response => {
        axios
          .get("http://vm-aurora.eaalab.hpi.uni-potsdam.de:5000/database")
          .then(result => (databases.value = result.data.body.databases));
        console.log(response);
      })
      .catch(error => {
        console.log(error);
      });
  }

  function getDummyDatabases(): Database[] {
    return [
      { id: "citadelle", color: getDatabaseColor() },
      { id: "york", color: getDatabaseColor() }
    ];
  }

  return {
    databases,
    addDatabase
  };
}
