import { Ref } from "@vue/composition-api";

export interface DatabaseSystemDetails {
  host: String;
  mainMemoryCapacity: number;
  memoryFootprint: number;
  numberOfCPUs: number;
  numberOfWorkers: number;
}

export interface Database {
  id: string;
  color: string;
  systemDetails: DatabaseSystemDetails;
}

export interface DatabaseService {
  databases: Ref<Database[]>;
  tables: Ref<string[]>;
  addDatabase: (databasedata: any) => void;
  isReady: Ref<boolean>;
}
