import { ref } from "@vue/composition-api";
import axios from "axios";
import { MetricMetadata } from "@/types/metrics";
import { FetchService } from "@/types/services";

export function useGenericFetchService(metric: MetricMetadata): FetchService {
  const queryReadyState = ref<boolean>(true);
  const data = ref<any>({});

  function getData(): void {
    queryReadyState.value = false;
    fetchData().then(result => {
      if (metric.fetchType === "modify") {
        Object.keys(result).forEach(key => {
          addData(key, metric.transformationService(result, key));
        });
      } else if (metric.fetchType === "read") {
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
        .get(metric.endpoint)
        .then(response => {
          resolve(response.data.body[metric.base]);
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
