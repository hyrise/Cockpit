import { Ref } from "@vue/composition-api";

export interface DatabaseSystemDetails {
  host: string;
  mainMemoryCapacity: number;
  memoryFootprint: number;
  numberOfCPUs: number;
  numberOfWorkers: number;
}

export interface Database {
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
  addDatabase: (databaseConnection: any) => void;
  getDatabases: () => Promise<any[]>;
  getDatabasesCPUInformation: () => Promise<any[]>;
  getDatabasesStorageInformation: () => Promise<any[]>;
  getDatabaseColor: () => string;
}

export type DatabaseResponse = {
  id: string;
  host: string;
  numberOfWorkers: number;
};

export type DatabaseCPUResponse = {
  id: string;
  numberOfCPUs: number;
  mainMemoryCapacity: number;
};

export type DatabaseStorageResponse = {
  id: string;
  memoryFootprint: number;
  tables: string[];
};
