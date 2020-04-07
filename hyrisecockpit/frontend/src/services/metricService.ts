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
  const metricMetaData = getMetricMetadata(metric);
  const maxValue = computed(
    () =>
      metricMetaData.staticAxesRange?.y?.max ||
      Object.values(data.value).reduce(
        (max: number, dataSet: any) => Math.max(...dataSet, max),
        0
      )
  );
  const historicFetching = ref(false);

  const { subSeconds, formatDateToNanoSec } = useFormatting();

  function getData(start?: Date, end?: Date): void {
    queryReadyState.value = false;

    const currentTimestamp = new Date();
    const startTime = start
      ? formatDateToNanoSec(start)
      : formatDateToNanoSec(subSeconds(currentTimestamp, 1));
    const endTime = end
      ? formatDateToNanoSec(end)
      : formatDateToNanoSec(currentTimestamp);

    fetchData(startTime, endTime).then(result => {
      useUpdatingData(result, metric);
      if (metricMetaData.fetchType === "modify") {
        result.forEach((data: any) => {
          handleDataChange(
            data.id,
            metricMetaData.transformationService(
              data[metricMetaData.base],
              metricMetaData.base
            )
          );
        });
      } else if (metricMetaData.fetchType === "read") {
        data.value = result;
      }
      handleTimestamps(
        result[0]?.[metricMetaData.base]?.map(
          (entry: any) => entry.timestamp
        ) ?? [formatDateToNanoSec(currentTimestamp)]
      );
      const dataCopy = JSON.parse(JSON.stringify(data.value));
      data.value = dataCopy;
      queryReadyState.value = true;
    });
  }

  function fetchData(start: number, end: number): Promise<any> {
    return new Promise((resolve, reject) => {
      axios
        .get(metricMetaData.endpoint, {
          params: {
            startts: start,
            endts: end
          }
        })
        .then(response => {
          if (
            metricMetaData.component === "QueryTypeProportion" ||
            metricMetaData.historic
          ) {
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

  function handleDataChange(databaseId: string, newData: number[]): void {
    if (!data.value[databaseId]) {
      data.value[databaseId] = [];
    }
    data.value[databaseId] = historicFetching.value
      ? handleHistoricDataPoints(newData)
      : handleCurrentDataPoints(data.value[databaseId], newData);
  }

  function handleTimestamps(newTimestamps: number[]): void {
    const dates = newTimestamps.map(
      timestamp => new Date(timestamp / Math.pow(10, 6))
    );
    timestamps.value = historicFetching.value
      ? handleHistoricDataPoints(dates)
      : handleCurrentDataPoints(timestamps.value, dates);
  }

  function handleCurrentDataPoints<T>(data: T[], newData: T[]): T[] {
    const dataCopy = data;
    newData.forEach((entry: T) => {
      if (dataCopy.length > 29) {
        dataCopy.shift();
      }
      dataCopy.push(entry);
    });

    return dataCopy;
  }

  function handleHistoricDataPoints<T>(newData: T[]): T[] {
    return newData.slice(newData.length - 30, newData.length - 1);
  }

  function getDataIfReady(start?: Date, end?: Date): void {
    historicFetching.value = !!start && !!end;
    if (queryReadyState.value || historicFetching.value) {
      getData(start, end);
    }
  }

  return { data, getDataIfReady, maxValue, timestamps };
}
