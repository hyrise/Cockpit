import { ref } from "@vue/composition-api";
import axios from "axios";
import { MetricMetadata } from "@/types/metrics";
import { FetchService } from "@/types/services";

export function useMetricService(metric: MetricMetadata): FetchService {
  const queryReadyState = ref<boolean>(true);
  const data = ref<any>({}); // TODO: change the initial value
  const maxValue = ref<number>(0);

  function getData(): void {
    queryReadyState.value = false;
    fetchData().then(result => {
      if (metric.fetchType === "modify") {
        Object.keys(result).forEach(key => {
          addData(key, metric.transformationService(result, key));
          updateMaxValue();
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

  function updateMaxValue() {
    Object.values(data.value).forEach((dataSet: any) => {
      const currentValue = dataSet[dataSet.length - 1];
      if (currentValue > maxValue.value) {
        maxValue.value = currentValue;
      }
    });
  }

  function fetchData(): Promise<any> {
    return new Promise((resolve, reject) => {
      axios
        .get(metric.endpoint)
        .then(response => {
          if (metric.component == "QueryTypeProportion") {
            //TODO: just for debug: adapt response in backend to pass data in body and divided for db instances
            resolve(response.data);
          } else {
            resolve(response.data.body[metric.base]);
          }
        })
        .catch(error => {
          queryReadyState.value = true;
          reject(error);
        });
    });
  }

  function getDataIfReady(): void {
    if (queryReadyState.value) {
      getData();
    }
  }

  return { data, getDataIfReady, maxValue };
}
