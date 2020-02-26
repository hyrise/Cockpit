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

export interface DatabaseService {
  databases: Ref<Database[]>;
  addDatabase: (databasedata: any) => void;
  isReady: Ref<boolean>;
}
