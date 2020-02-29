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
  databasesUpdated: Ref<boolean>;
  availableDatabasesById: Ref<readonly string[]>;
  getDatabasesByIds: (ids: string[]) => Database[];
}

export interface DatabaseService {
  addDatabase: (databasedata: any) => void;
  getDatabases: () => Promise<any[]>;
  getDatabasesCPUInformation: () => Promise<any[]>;
  getDatabasesStorageInformation: () => Promise<any[]>;
  getDatabaseColor: () => string;
}
