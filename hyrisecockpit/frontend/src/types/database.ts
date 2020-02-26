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

export interface DatabaseService {
  databases: Ref<Database[]>;
  tables: Ref<string[]>;
  addDatabase: (databasedata: any) => void;
  isReady: Ref<boolean>;
}
