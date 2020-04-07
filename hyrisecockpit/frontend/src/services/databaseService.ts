import {
  DatabaseService,
  DatabaseCPUResponse,
  DatabaseStorageResponse,
  DatabaseResponse
} from "../types/database";
import axios from "axios";
import { colorDefinition } from "../meta/colors";
import { monitorBackend, controlBackend } from "../../config";
import { useDataTransformationHelpers } from "./transformationService";
import { useDatabaseEvents } from "../meta/events";

export function useDatabaseService(): DatabaseService {
  const {
    emitDatabaseAddedEvent,
    emitDatabaseRemovedEvent
  } = useDatabaseEvents();

  const {
    getDatabaseMemoryFootprint,
    getDatabaseMainMemoryCapacity
  } = useDataTransformationHelpers();

  async function fetchDatabases(): Promise<DatabaseResponse[]> {
    let databases: DatabaseResponse[] = [];
    await axios.get(controlBackend + "database").then(response => {
      databases = getDatabasesInformation(response.data);
    });
    return databases;
  }

  function getDatabaseColor(databaseID: string): string {
    const hashedDatabaseID = require("crypto")
      .createHash("sha1")
      .update(databaseID)
      .digest("hex");
    const index =
      parseInt(hashedDatabaseID, 16) % Object.keys(colorDefinition).length;
    let color = Object.values(colorDefinition)[index];
    return color;
  }

  async function fetchDatabasesCPUInformation(): Promise<
    DatabaseCPUResponse[]
  > {
    let databasesWithCPUInformation: DatabaseCPUResponse[] = [];
    await axios.get(monitorBackend + "system").then(response => {
      databasesWithCPUInformation = getCPUInformation(
        response.data.body.system_data
      );
    });
    return databasesWithCPUInformation;
  }

  async function fetchDatabasesStorageInformation(): Promise<
    DatabaseStorageResponse[]
  > {
    let databasesWithStorageInformation: DatabaseStorageResponse[] = [];
    await axios.get(monitorBackend + "storage").then(response => {
      databasesWithStorageInformation = getStorageInformation(
        response.data.body.storage
      );
    });
    return databasesWithStorageInformation;
  }

  function getDatabasesInformation(response: any): DatabaseResponse[] {
    const databases: DatabaseResponse[] = [];
    Object.values(response).forEach((data: any) => {
      databases.push({
        id: data.id,
        host: data.host,
        numberOfWorkers: data.number_workers
      } as DatabaseResponse);
    });
    return databases;
  }

  function getCPUInformation(response: any): DatabaseCPUResponse[] {
    const databasesWithCPUInformation: DatabaseCPUResponse[] = [];
    Object.entries(response).forEach(([id, data]: [string, any]) => {
      databasesWithCPUInformation.push({
        id: id,
        numberOfCPUs: data.cpu.cpu_count,
        memoryCapacity: getDatabaseMainMemoryCapacity(data)
      } as DatabaseCPUResponse);
    });
    return databasesWithCPUInformation;
  }

  function getStorageInformation(response: any): DatabaseStorageResponse[] {
    const databasesWithStorageInformation: DatabaseStorageResponse[] = [];
    Object.entries(response).forEach(([id, data]: [string, any]) => {
      databasesWithStorageInformation.push({
        id: id,
        memoryFootprint: getDatabaseMemoryFootprint(data),
        tables: Object.keys(data)
      } as DatabaseStorageResponse);
    });
    return databasesWithStorageInformation;
  }

  function addDatabase(databaseConnection: any): void {
    axios.post(controlBackend + "database", databaseConnection).then(() => {
      emitDatabaseAddedEvent();
    });
  }

  function removeDatabase(databaseId: string): void {
    axios
      .delete(controlBackend + "database", {
        data: { id: databaseId }
      })
      .then(() => {
        emitDatabaseRemovedEvent();
      });
  }

  return {
    addDatabase,
    removeDatabase,
    fetchDatabases,
    fetchDatabasesCPUInformation,
    fetchDatabasesStorageInformation,
    getDatabaseColor,
    getCPUInformation,
    getStorageInformation
  };
}
