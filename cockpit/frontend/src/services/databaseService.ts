import { Ref, ref } from "@vue/composition-api";
import { Database } from "../types/database";
import axios from "axios";

export function useDatabaseFetchService(): {
  getDatabases: () => void;
  getDummyDatabases: () => void;
  databases: Ref<Database[]>
} {
    const databases= ref<Database[]>(getDummyDatabases());


    function getDatabases(): void {
        axios.get("http://192.168.30.126:5000/").then(response => {
            databases.value= response.data
        });
    }

    function getDummyDatabases(): Database[] {
        return [{id: 'aurora'}, {id: 'citadelle'}, {id: 'york'}]
    }



  return { getDatabases, databases, getDummyDatabases };
}
