import { Ref, ref } from "@vue/composition-api";
import axios from "axios";

import { getEndpoint, getBase } from "./helpers/serviceEndpoints";

export function useStorageFetchService(): {
  storageData: Ref<Object | null>;
  getStorage: () => void;
} {
  const endpoint = getEndpoint("storage");
  const base = getBase("storage");
  const storageData = ref<Object>(null);
  getStorage();

  function getStorage(): void {
    fetchStorageData().then(result => {
      storageData.value = result;
    });
  }

  function fetchStorageData(): Promise<Object> {
    return new Promise((resolve, reject) => {
      axios
        .get(endpoint)
        .then(response => {
          resolve(response.data.body[base]);
        })
        .catch(error => {
          reject(error);
        });
    });
  }

  return { getStorage, storageData };
}
