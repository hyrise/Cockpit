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
      databases.value = response.data.map((database: any) => ({
        id: database.id,
        color: getDatabaseColor(database.id),
        systemDetails: {
          host: database.host,
          mainMemoryCapacity: 0,
          memoryFootprint: 0,
          numberOfCPUs: 0,
          numberOfWorkers: database.number_workers
        }
      }));
      getDatabaseCPUInformation();
      getDatabaseMemoryFootprintInformation();
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

  function getDatabaseMemoryFootprintInformation(): void {
    axios.get(monitorBackend + "storage").then(response => {
      Object.entries(response.data.body.storage).forEach(([id, data]) => {
        const database = databases.value.find(database => database.id === id);
        let sum = 0;
        Object.values(data as any).forEach((table: any) => (sum += table.size));
        database!.systemDetails.memoryFootprint =
          Math.floor(sum / Math.pow(10, 3)) / 1000;
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
