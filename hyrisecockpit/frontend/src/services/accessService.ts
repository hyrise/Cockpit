import { Ref, ref } from "@vue/composition-api";
import axios from "axios";

import { getEndpoint, getBase } from "./helpers/serviceEndpoints";

export function useAccessFetchService(): {
  data: Ref<Object | null>;
  getAccess: () => void;
} {
  const endpoint = getEndpoint("access");
  const base = getBase("access");
  const data = ref<Object>(null);
  getAccess();

  function getAccess(): void {
    fetchAccessData().then(result => {
      data.value = result;
    });
  }

  function fetchAccessData(): Promise<Object> {
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

  return { getAccess,data };
}