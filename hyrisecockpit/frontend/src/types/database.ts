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
  blocked: boolean;
  active: boolean;
}

export interface DatabaseService {
  addDatabase: (databaseConnection: any) => void;
  removeDatabase: (databaseId: string) => void;
  fetchDatabases: () => Promise<any[]>;
  fetchDatabasesCPUInformation: () => Promise<any[]>;
  fetchDatabasesStorageInformation: () => Promise<any[]>;
  getDatabaseColor: (databaseID: string) => string;
  getStorageInformation: (response: any) => DatabaseStorageResponse[];
  getCPUInformation: (response: any) => DatabaseCPUResponse[];
  postSQLQuery: (databseId: string, sqlQuery: string) => Promise<any>;
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
