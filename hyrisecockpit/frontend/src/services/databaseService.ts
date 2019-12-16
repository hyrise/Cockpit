import { Ref, ref } from "@vue/composition-api";
import { Database } from "../types/database";
import axios from "axios";
import { useColorConfiguration } from "../helpers/colors"

export function useDatabaseFetchService(): {
  getDatabases: () => void;
  databases: Ref<Database[]>;
} {
  const databases = ref<Database[]>(getDummyDatabases());
  const { getDatabaseColor }= useColorConfiguration();

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
    console.log('database')
    console.log(getDatabaseColor);
    return [
      { id: "citadelle", color: getDatabaseColor() },
      { id: "york", color: 'green' }
    ];
  }

  return {
    getDatabases,
    databases,
  };
}

