import { Ref, ref } from "@vue/composition-api";
import { Database, DatabaseColor } from "../types/database";
import axios from "axios";

var randomMC = require("random-material-color");

export function useDatabaseFetchService(): {
  getDatabases: () => void;
  getDummyDatabases: () => void;
  databases: Ref<Database[]>;
  databaseIds: Ref<string[]>;
  getDatabaseColor: (databaseId: string) => string;
} {
  const databases = ref<Database[]>(getDummyDatabases());
  const databaseIds = ref<string[]>(getDatabaseIds());
  //const databaseColors = ref<string[]>(getDatabaseColors());

  function getDatabases(): Database[] {
    axios
      .get("http://vm-aurora.eaalab.hpi.uni-potsdam.de:5000/drivers")
      .then(response => {
        return response.data.body.ids.map(database => ({
          id: database
        }));
      });
  }

  let databaseColorMap: DatabaseColor = {};

  function getDatabaseColor(databaseId: string): string {
    if (!databaseColorMap[databaseId]) {
      databaseColorMap[databaseId] = randomMC.getColor();
    }
    return databaseColorMap[databaseId];
  }

  function getDummyDatabases(): Database[] {
    return [{ id: "citadelle" }, { id: "york" }];
  }

  function getDatabaseIds(): string[] {
    return databases.value ? databases.value.map(database => database.id) : [];
  }

  return {
    getDatabases,
    databases,
    getDummyDatabases,
    databaseIds,
    getDatabaseColor
  };
}
