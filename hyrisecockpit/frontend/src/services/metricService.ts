import { ref } from "@vue/composition-api";
import axios from "axios";
import { Metric } from "@/types/metrics";
import { FetchService } from "@/types/services";
import { useUpdatingData } from "../meta/components";
import { getMetricMetadata } from "../meta/metrics";

export function useMetricService(metric: Metric): FetchService {
  const queryReadyState = ref<boolean>(true);
  const data = ref<any>({});
  const maxValue = ref<number>(0);
  const timestamps = ref<Date[]>([]);
  const metricMetaData = getMetricMetadata(metric);

  function getData(): void {
    queryReadyState.value = false;
    fetchData().then(result => {
      useUpdatingData(result, metric);
      if (metricMetaData.fetchType === "modify") {
        Object.keys(result).forEach(key => {
          addData(key, metricMetaData.transformationService(result, key));
        });
      } else if (metricMetaData.fetchType === "read") {
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
        .get(metricMetaData.endpoint)
        .then(response => {
          if (metricMetaData.component == "QueryTypeProportion") {
            //TODO: just for debug: adapt response in backend to pass data in body and divided for db instances
            resolve(response.data);
          } else {
            resolve(response.data.body[metricMetaData.base]);
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
      updateMaxValue();
      timestamps.value.push(new Date());
    }
  }

  return { data, getDataIfReady, maxValue, timestamps };
}
