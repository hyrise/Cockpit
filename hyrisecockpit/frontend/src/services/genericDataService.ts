import { Ref, ref } from "@vue/composition-api";
import axios from "axios";

import { getEndpoint, getBase } from "./helpers/serviceEndpoints";

export function useGenericDataService(
  dataType: string
): {
  data: Ref<any>;
  getData: () => void;
} {
  const endpoint = getEndpoint(dataType);
  const base = getBase(dataType);
  const data = ref<Object>(null);
  getData();

  function getData(): void {
    fetchData().then(result => {
      data.value = result;
    });
  }

  function fetchData(): Promise<Object> {
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

  return { getData, data };
}
