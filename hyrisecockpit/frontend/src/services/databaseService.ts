import { Ref, ref } from "@vue/composition-api";
import { Database } from "../types/database";
import axios from "axios";
import colors from "vuetify/lib/util/colors";

export function useDatabaseFetchService(): {
  getDatabases: () => void;
  databases: Ref<Database[]>;
} {
  const colorsArray = Object.keys(colors);
  let usedColors = 0;
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

  function getDatabaseColor(): string {
    console.log(colors);
    const color: any = colors[colorsArray[usedColors]].base;
    usedColors += 2;
    return color;
  }

  function getDummyDatabases(): Database[] {
    return [
      { id: "citadelle", color: getDatabaseColor() },
      { id: "york", color: getDatabaseColor() }
    ];
  }

  return {
    getDatabases,
    databases
  };
}
