import { Ref } from "@vue/composition-api";

export interface DatabaseSystemDetails {
  host: string;
  mainMemoryCapacity: number;
  memoryFootprint: number;
  numberOfCPUs: number;
  numberOfWorkers: number;
}

export interface Database {
  //TODO: when updating consider to make this all refs
  id: string;
  color: string;
  systemDetails: DatabaseSystemDetails;
  tables: string[];
}

export interface DatabaseController {
  databases: Record<string, Database>;
  databasesUpdated: Ref<boolean>;
}

export interface DatabaseService {
  addDatabase: (databasedata: any) => void;
  getDatabases: () => Promise<any[]>;
  getDatabasesCPUInformation: () => Promise<any[]>;
  getDatabasesStorageInformation: () => Promise<any[]>;
  setDatabaseColor: () => string;
}
