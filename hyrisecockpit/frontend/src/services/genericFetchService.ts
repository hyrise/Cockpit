import { ref } from "@vue/composition-api";
import axios from "axios";
import { Component } from "@/types/components";
import { FetchService } from "@/types/services";

export function useGenericFetchService(component: Component): FetchService {
  const queryReadyState = ref<boolean>(true);
  const data = ref<any>({});

  function getData(): void {
    queryReadyState.value = false;
    fetchData().then(result => {
      if (component.fetchType === "modify") {
        Object.keys(result).forEach(key => {
          addData(key, component.transformationService(result, key));
        });
      } else if (component.fetchType === "read") {
        data.value = result;
      }
      queryReadyState.value = true;
    });
  }

  function addData(dataBaseId: string, newData: number): void {
    if (!data.value[dataBaseId]) {
      data.value[dataBaseId] = [];
    }
    data.value[dataBaseId].push(newData);
    const dataCopy = JSON.parse(JSON.stringify(data.value));
    data.value = dataCopy;
  }

  function fetchData(): Promise<any> {
    return new Promise((resolve, reject) => {
      axios
        .get(component.endpoint)
        .then(response => {
          resolve(response.data.body[component.base]);
        })
        .catch(error => {
          queryReadyState.value = true;
          reject(error);
        });
    });
  }

  function checkState(): void {
    if (queryReadyState.value) {
      getData();
    }
  }

  return { data, checkState };
}
