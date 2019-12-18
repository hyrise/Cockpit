import { Ref, ref } from "@vue/composition-api";
import axios from "axios";
import { StorageQueryResult } from "../types/storage";

export function useStorageFetchService(): {
  storageData: Ref<Object>;
  getStorage: () => void;
} {
  const storageData = ref<Object>({});
  console.log(storageData, 'storage data');
  getStorage()

  function getStorage(): void {
    fetchStorageData().then(result => {
      console.log(result);
      storageData.value = result;
    });
  }

  function fetchStorageData(): Promise<Object> {
    return new Promise((resolve, reject) => {
      axios
        .get("http://vm-aurora.eaalab.hpi.uni-potsdam.de:8000/storage")
        .then(response => {
          console.log(response, 'response')
          resolve(response.data);
        })
        .catch(error => {
          reject(error);
        });
    });
  }

  function transformDataFormat(data: any): StorageQueryResult[] {
    const dataArray: StorageQueryResult[] = [];
    const tableData: StorageQueryResult[] = data["columninfo"];
    for (let i = 0; i < tableData.length; i++) {
      const columnData = tableData[i];
      let entry: StorageQueryResult = {
        table: columnData["table"],
        column: columnData["column"],
        size: columnData["size"],
        dataType: columnData["dataType"],
        encoding: columnData["encoding"]
      };

      dataArray.push(entry);
    }
    return dataArray;
  }

  return { getStorage, storageData };
}
