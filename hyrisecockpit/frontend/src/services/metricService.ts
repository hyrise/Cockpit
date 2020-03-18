import { ref, computed } from "@vue/composition-api";
import axios from "axios";
import { Metric } from "@/types/metrics";
import { MetricService } from "@/types/services";
import { useUpdatingData } from "../meta/components";
import { getMetricMetadata } from "../meta/metrics";
import { useFormatting } from "@/meta/formatting";

export function useMetricService(metric: Metric): MetricService {
  const queryReadyState = ref(true);
  const data = ref<any>({});
  const timestamps = ref<Date[]>([]);
  const maxValue = computed(() =>
    Object.values(data.value).reduce(
      (max: number, dataSet: any) => Math.max(...dataSet, max),
      0
    )
  );
  const metricMetaData = getMetricMetadata(metric);
  const { formatDateWithoutMilliSec } = useFormatting();

  function getData(): void {
    queryReadyState.value = false;
    fetchData().then(result => {
      useUpdatingData(result, metric);
      if (metricMetaData.fetchType === "modify") {
        Object.keys(result).forEach(key => {
          handleDataChange(
            key,
            metricMetaData.transformationService(result, key)
          );
        });
      } else if (metricMetaData.fetchType === "read") {
        data.value = result;
      }
      handleTimestamps();
      const dataCopy = JSON.parse(JSON.stringify(data.value));
      data.value = dataCopy;
      queryReadyState.value = true;
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

  function handleDataChange(databaseId: string, newData: number): void {
    if (!data.value[databaseId]) {
      data.value[databaseId] = [];
    }
    data.value[databaseId] = handleDataPoints(data.value[databaseId], newData);
  }

  function handleTimestamps(): void {
    timestamps.value = handleDataPoints(
      timestamps.value,
      formatDateWithoutMilliSec(new Date())
    );
  }

  function handleDataPoints<T>(data: T[], newData: T): T[] {
    const dataCopy = data;
    if (dataCopy.length > 29) {
      dataCopy.shift();
    }
    dataCopy.push(newData);
    return dataCopy;
  }

  function getDataIfReady(): void {
    if (queryReadyState.value) {
      getData();
    }
  }

  return { data, getDataIfReady, maxValue, timestamps };
}
