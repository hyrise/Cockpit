import { ref } from "@vue/composition-api";
import { Database, DatabaseService } from "../types/database";
import axios from "axios";
import colors from "vuetify/lib/util/colors";
import { monitorBackend, controlBackend } from "../../config";

export function useDatabaseService(): DatabaseService {
  const colorsArray: any = Object.keys(colors);
  let usedColors: any = 0;
  const databases = ref<Database[]>([]);
  const isReady = ref<boolean>(false);
  const tables = ref<string[]>([]);

  function getTables(): void {
    axios.get(monitorBackend + "storage").then(result => {
      const instance = Object.keys(result.data.body.storage)[0];
      tables.value = Object.keys(result.data.body.storage[instance]);
    });
  }

  function getDatabases(): void {
    axios.get(controlBackend + "database").then(response => {
      databases.value = response.data.body.databases.map(
        (databaseId: string) => ({
          id: databaseId,
          color: getDatabaseColor(databaseId),
          systemDetails: {
            host: databaseId,
            mainMemoryCapacity: 1000,
            memoryFootprint: 100,
            numberOfCPUs: 16,
            numberOfWorkers: 8
          }
        })
      );
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

  function addDatabase(databaseService: any): void {
    axios
      .post(controlBackend + "database", databaseService)
      .then(response => {
        axios.get(controlBackend + "database").then(
          result =>
            (databases.value = result.data.body.databases.map(
              (database: any) => ({
                id: database,
                color: getDatabaseColor(database)
              })
            ))
        );
      })
      .catch(error => {});
  }

  return {
    databases,
    addDatabase,
    isReady,
    tables
  };
}
