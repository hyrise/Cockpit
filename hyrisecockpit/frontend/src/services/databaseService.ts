import { ref } from "@vue/composition-api";
import { Database, DatabaseService } from "../types/database";
import axios from "axios";
import colors from "vuetify/lib/util/colors";
import { monitorBackend, controlBackend } from "../../config";
import { useDataTransformationHelpers } from "./transformationService";

export function useDatabaseService(): DatabaseService {
  const colorsArray: any = Object.keys(colors);
  let usedColors: any = 0;
  const databases = ref<Database[]>([]);
  const isReady = ref<boolean>(false);
  const tables = ref<string[]>([]);
  const { getDatabaseMemoryFootprint } = useDataTransformationHelpers();

  getDatabases();

  function getDatabases(): void {
    axios.get(controlBackend + "database").then(response => {
      databases.value = response.data.map((database: any) => ({
        id: database.id,
        color: getDatabaseColor(database.id),
        systemDetails: {
          host: database.host,
          mainMemoryCapacity: 0,
          memoryFootprint: 0,
          numberOfCPUs: 0,
          numberOfWorkers: database.number_workers
        },
        tables: []
      }));
      getDatabaseCPUInformation();
      getDatabaseStorageInformation();
      isReady.value = true;
    });
  }

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

  function getDatabaseCPUInformation(): void {
    axios.get(monitorBackend + "system").then(response => {
      Object.entries(response.data.body.system_data).forEach(([id, data]) => {
        const database = databases.value.find(database => database.id === id);
        database!.systemDetails.numberOfCPUs = Object.keys(
          (data as any).cpu
        ).length;
        database!.systemDetails.mainMemoryCapacity =
          Math.floor((data as any).memory.total / Math.pow(10, 6)) / 1000;
      });
    });
  }

  function getDatabaseStorageInformation(): void {
    axios.get(monitorBackend + "storage").then(response => {
      Object.entries(response.data.body.storage).forEach(([id, data]) => {
        const database = databases.value.find(database => database.id === id);
        database!.systemDetails.memoryFootprint = getDatabaseMemoryFootprint(
          data
        );
        database!.tables = Object.keys(data as any);
        console.log(database!.tables);
      });
    });
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
