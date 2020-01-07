import { Ref, ref } from "@vue/composition-api";
import { Database } from "../types/database";
import axios from "axios";
import colors from "vuetify/lib/util/colors";

export function useDatabaseFetchService(): {
  databases: Ref<Database[]>;
  tables: Ref<string[]>;
  addDatabase: (databasedata: any) => void;
} {
  const colorsArray = Object.keys(colors);
  let usedColors = 0;
  const databases = ref<Database[]>(getDummyDatabases());
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
    axios.get("http://vm-aurora.eaalab.hpi.uni-potsdam.de:8000/database").then(
      response =>
        (databases.value = response.data.body.databases.map(database => ({
          id: database,
          color: getDatabaseColor(database)
        })))
    );
  }

  getDatabases();
  getDummyTables();

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
        console.log(response);
      })
      .catch(error => {
        console.log(error);
      });
  }
  function getDummyTables(): void {
    tables.value = [
      "customer",
      "lineitem",
      "nation",
      "orders",
      "part",
      "partsupp",
      "region",
      "supplier"
    ];
  }

  function getDummyDatabases(): Database[] {
    return [
      { id: "citadelle", color: getDatabaseColor("citadelle") },
      { id: "york", color: getDatabaseColor("york") }
    ];
  }

  return {
    databases,
    addDatabase,
    tables
  };
}
