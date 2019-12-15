import { Ref, ref } from "@vue/composition-api";
import { Database } from "../types/database";
import axios from "axios";

export function useDatabaseFetchService(): {
  getDatabases: () => void;
  getDummyDatabases: () => void;
  databases: Ref<Database[]>;
} {
  const dummyColors = ["green", "red", "blue"]; // TODO: use array of material design colors
  const databases = ref<Database[]>(getDummyDatabases());

  function getDatabases(): void {
    axios
      .get("http://vm-aurora.eaalab.hpi.uni-potsdam.de:5000/drivers")
      .then(response => {
        return response.data.body.ids.map(database => ({
          id: database
        }));
      });
  }

  function getDummyDatabases(): Database[] {
    return [
      { id: "citadelle", color: dummyColors[0] },
      { id: "york", color: dummyColors[1] }
    ];
  }

  function getDatabaseIds(): string[] {
    return databases.value ? databases.value.map(database => database.id) : [];
  }

  return {
    getDatabases,
    databases,
    getDummyDatabases
  };
}
