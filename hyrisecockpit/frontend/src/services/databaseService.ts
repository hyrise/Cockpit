import {
  DatabaseService,
  DatabaseCPUResponse,
  DatabaseStorageResponse,
  DatabaseResponse,
} from "@/types/database";
import axios from "axios";
import { colorDatabaseDefinition } from "@/meta/colors";
import { monitorBackend, controlBackend } from "../../config";
import { useDataTransformationHelpers } from "@/services/transformationService";
import { useDatabaseEvents } from "@/meta/events";
import { useFormatting } from "@/meta/formatting";

export function useDatabaseService(): DatabaseService {
  const { formatDateToNanoSec, subSeconds, getNanoSeconds } = useFormatting();
  const {
    emitDatabaseAddedEvent,
    emitDatabaseRemovedEvent,
  } = useDatabaseEvents();

  const {
    getDatabaseMemoryFootprint,
    getDatabaseMainMemoryCapacity,
  } = useDataTransformationHelpers();

  async function fetchDatabases(): Promise<DatabaseResponse[]> {
    let databases: DatabaseResponse[] = [];
    await axios.get(controlBackend + "database/").then((response) => {
      databases = getDatabasesInformation(response.data);
    });
    return databases;
  }

  function getDatabaseColor(databaseID: string): string {
    let hashedDatabaseID = 0;
    Object.values(databaseID).forEach((symbol: any) => {
      hashedDatabaseID =
        (hashedDatabaseID << 5) -
        hashedDatabaseID +
        databaseID.charCodeAt(symbol);
      hashedDatabaseID = hashedDatabaseID & hashedDatabaseID;
    });
    const index =
      Math.abs(hashedDatabaseID) % Object.keys(colorDatabaseDefinition).length;
    let color = Object.values(colorDatabaseDefinition)[index];
    return color;
  }

  async function fetchDatabasesCPUInformation(): Promise<
    DatabaseCPUResponse[]
  > {
    let databasesWithCPUInformation: DatabaseCPUResponse[] = [];
    const currentDate = subSeconds(new Date(), 3);
    await axios
      .get(monitorBackend + "system", {
        params: {
          startts: formatDateToNanoSec(subSeconds(currentDate, 1)),
          endts: formatDateToNanoSec(currentDate),
          precision: getNanoSeconds(1),
        },
      })
      .then((response) => {
        databasesWithCPUInformation = getCPUInformation(response.data);
      });
    return databasesWithCPUInformation;
  }

  async function fetchDatabasesStorageInformation(): Promise<
    DatabaseStorageResponse[]
  > {
    let databasesWithStorageInformation: DatabaseStorageResponse[] = [];
    await axios.get(monitorBackend + "storage").then((response) => {
      databasesWithStorageInformation = getStorageInformation(
        response.data.body.storage
      );
    });
    return databasesWithStorageInformation;
  }

  function getDatabasesInformation(response: any): DatabaseResponse[] {
    const databases: DatabaseResponse[] = [];
    response.forEach((data: any) => {
      databases.push({
        id: data.id,
        host: data.host,
        numberOfWorkers: data.number_workers,
      } as DatabaseResponse);
    });
    return databases;
  }

  function getCPUInformation(response: any): DatabaseCPUResponse[] {
    const databasesWithCPUInformation: DatabaseCPUResponse[] = [];
    response.forEach((databaseData: any) => {
      const cpuData =
        databaseData.system_data[databaseData.system_data.length - 1] || [];
      databasesWithCPUInformation.push({
        id: databaseData.id,
        numberOfCPUs: cpuData?.system_data?.cpu?.cpu_count ?? 0,
        memoryCapacity: getDatabaseMainMemoryCapacity(cpuData.system_data),
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
        tables: Object.keys(data),
      } as DatabaseStorageResponse);
    });
    return databasesWithStorageInformation;
  }

  function addDatabase(databaseConnection: any): void {
    axios.post(controlBackend + "database/", databaseConnection).then(() => {
      emitDatabaseAddedEvent();
    });
  }

  function removeDatabase(databaseId: string): void {
    axios
      .delete(controlBackend + "database/", {
        data: { id: databaseId },
      })
      .then(() => {
        emitDatabaseRemovedEvent();
      });
  }

  function postSQLQuery(databaseId: string, sqlQuery: string): Promise<any> {
    return axios.post(controlBackend + "sql/", {
      id: databaseId,
      query: sqlQuery,
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
    getStorageInformation,
    postSQLQuery,
  };
}
