import { Ref } from "@vue/composition-api";

export interface Database {
  id: string;
  color: string;
}

export interface DatabaseService {
  databases: Ref<Database[]>;
  tables: Ref<string[]>;
  addDatabase: (databasedata: any) => void;
  isReady: Ref<boolean>;
}
