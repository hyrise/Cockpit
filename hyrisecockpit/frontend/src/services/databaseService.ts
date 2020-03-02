import {
  DatabaseService,
  DatabaseCPUResponse,
  DatabaseStorageResponse,
  DatabaseResponse
} from "../types/database";
import axios from "axios";
import colors from "vuetify/lib/util/colors";
import { monitorBackend, controlBackend } from "../../config";
import { useDataTransformationHelpers } from "./transformationService";
import { useDatabaseEvents } from "../meta/events";

export function useDatabaseService(): DatabaseService {
  //TODO: think about how to handle colors now
  const colorsArray: any = Object.keys(colors);
  let usedColors: any = 0;
  const { emitDatabaseAddedEvent } = useDatabaseEvents();

  const {
    getDatabaseMemoryFootprint,
    getDatabaseMainMemoryCapacity
  } = useDataTransformationHelpers();

  async function getDatabases(): Promise<DatabaseResponse[]> {
    const databases: DatabaseResponse[] = [];
    await axios.get(controlBackend + "database").then(response => {
      Object.values(response.data).forEach((data: any) => {
        databases.push({
          id: data.id,
          host: data.host,
          numberOfWorkers: data.number_workers
        } as DatabaseResponse);
      });
    });
    return databases;
  }

  function getDatabaseColor(): string {
    const color: any = (colors as any)[colorsArray[usedColors]].base;
    usedColors += 2;
    return color;
  }

  async function getDatabasesCPUInformation(): Promise<DatabaseCPUResponse[]> {
    const databasesWithCPUInformation: DatabaseCPUResponse[] = [];
    await axios.get(monitorBackend + "system").then(response => {
      Object.entries(response.data.body.system_data).forEach(
        ([id, data]: [string, any]) => {
          databasesWithCPUInformation.push({
            id: id,
            numberOfCPUs: Object.keys(data.cpu).length,
            mainMemoryCapacity: getDatabaseMainMemoryCapacity(data)
          } as DatabaseCPUResponse);
        }
      );
    });
    return databasesWithCPUInformation;
  }

  async function getDatabasesStorageInformation(): Promise<
    DatabaseStorageResponse[]
  > {
    const databasesWithStorageInformation: DatabaseStorageResponse[] = [];
    await axios.get(monitorBackend + "storage").then(response => {
      Object.entries(response.data.body.storage).forEach(
        ([id, data]: [string, any]) => {
          databasesWithStorageInformation.push({
            id: id,
            memoryFootprint: getDatabaseMemoryFootprint(data),
            tables: Object.keys(data)
          } as DatabaseStorageResponse);
        }
      );
    });
    return databasesWithStorageInformation;
  }

  function addDatabase(databaseConnection: any): void {
    axios.post(controlBackend + "database", databaseConnection).then(() => {
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
