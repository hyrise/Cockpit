import { Ref } from "@vue/composition-api";

export interface DatabaseSystemDetails {
  host: string;
  memoryCapacity: number;
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
  getDatabaseById: (id: string) => Database;
}

export interface DatabaseService {
  addDatabase: (databaseConnection: any) => void;
  fetchDatabases: () => Promise<any[]>;
  fetchDatabasesCPUInformation: () => Promise<any[]>;
  fetchDatabasesStorageInformation: () => Promise<any[]>;
  getDatabaseColor: () => string;
  getStorageInformation: (response: any) => DatabaseStorageResponse[];
  getCPUInformation: (response: any) => DatabaseCPUResponse[];
}

export type DatabaseResponse = {
  id: string;
  host: string;
  numberOfWorkers: number;
};

export type DatabaseCPUResponse = {
  id: string;
  numberOfCPUs: number;
  memoryCapacity: number;
};

export type DatabaseStorageResponse = {
  id: string;
  memoryFootprint: number;
  tables: string[];
};
