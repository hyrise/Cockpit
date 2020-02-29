import { ref } from "@vue/composition-api";
import { Database, DatabaseService } from "../types/database";
import axios from "axios";
import colors from "vuetify/lib/util/colors";
import { monitorBackend, controlBackend } from "../../config";
import { useDataTransformationHelpers } from "./transformationService";
import { useDatabaseEvents } from "../meta/events";

export function useDatabaseService(): DatabaseService {
  const colorsArray: any = Object.keys(colors);
  let usedColors: any = 0;
  const { emitDatabaseAddedEvent } = useDatabaseEvents();

  const {
    getDatabaseMemoryFootprint,
    getDatabaseMainMemoryCapacity
  } = useDataTransformationHelpers();

  async function getDatabases(): Promise<any[]> {
    //TODO: add types
    const fetchedDatabases: any[] = [];
    await axios.get(controlBackend + "database").then(response => {
      Object.values(response.data).forEach(data => {
        fetchedDatabases.push({
          id: (data as any).id,
          host: (data as any).host,
          numberOfWorkers: (data as any).number_workers
        });
      });
    });
    return fetchedDatabases;
  }

  function getDatabaseColor(): string {
    const color: any = (colors as any)[colorsArray[usedColors]].base;
    usedColors += 2;
    return color;
  }

  async function getDatabasesCPUInformation(): Promise<any[]> {
    const databasesWithCPUInformation: any[] = [];
    await axios.get(monitorBackend + "system").then(response => {
      Object.entries(response.data.body.system_data).forEach(([id, data]) => {
        databasesWithCPUInformation.push({
          id: id,
          numberOfCPUs: Object.keys((data as any).cpu).length,
          mainMemoryCapacity: getDatabaseMainMemoryCapacity(data)
        });
      });
    });
    return databasesWithCPUInformation;
  }

  async function getDatabasesStorageInformation(): Promise<any[]> {
    const databasesWithStorageInformation: any = [];
    await axios.get(monitorBackend + "storage").then(response => {
      Object.entries(response.data.body.storage).forEach(([id, data]) => {
        databasesWithStorageInformation.push({
          id: id,
          memoryFootprint: getDatabaseMemoryFootprint(data),
          tables: Object.keys(data as any)
        });
      });
    });
    return databasesWithStorageInformation;
  }

  function addDatabase(databaseService: any): void {
    axios.post(controlBackend + "database", databaseService).then(() => {
      emitDatabaseAddedEvent();
    });
  }

  return {
    addDatabase,
    getDatabases,
    getDatabasesCPUInformation,
    getDatabasesStorageInformation,
    getDatabaseColor
  };
}
