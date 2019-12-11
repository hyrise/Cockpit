import { Ref, ref } from "@vue/composition-api";
import { Database } from "../types/database";
import axios from "axios";

export function useDatabaseFetchService(): {
  getDatabases: () => void;
  getDummyDatabases: () => void;
  databases: Ref<Database[]>;
  databaseIds: Ref<string[]>;
} {
  const databases = ref<Database[]>(getDummyDatabases());
  const databaseIds = ref<string[]>(getDummyDatabaseIds());

  function getDatabases(): void {
    axios.get("http://192.168.30.126:5000/").then(response => {
      databases.value = response.data;
    });
  }

  function getDummyDatabases(): Database[] {
    return [
      { id: "vm-citadelle.eaalab.hpi.uni-potsdam.de" },
      { id: "vm-york.eaalab.hpi.uni-potsdam.de" }
    ];
  }

  function getDummyDatabaseIds(): string[] {
    return databases.value.map(database => database.id);
  }

  return { getDatabases, databases, getDummyDatabases, databaseIds };
}
