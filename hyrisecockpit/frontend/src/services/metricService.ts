import { ref, reactive } from "@vue/composition-api";
import axios from "axios";
import { Metric } from "@/types/metrics";
import { MetricService } from "@/types/services";
import { useUpdatingData } from "../meta/components";
import { getMetricMetadata } from "../meta/metrics";
import { useFormatting } from "@/meta/formatting";
import { isInTestMode } from "../../config";
import Vue from "vue";

// fetch data for all metrics with same endpoint
export function useMetricService(
  metrics: Metric[],
  gethistoricRangeSeconds: () => number
): MetricService {
  const queryReadyState = ref(true);
  const data: any = initializeData({});
  const timestamps = ref<Date[]>([]);
  const metricsMetaData = metrics.map((metric) => getMetricMetadata(metric));
  const metricInfo = metricsMetaData[0];
  const maxValues = initializeData(0) as Record<Metric, number>;
  const historicFetching = ref(false);

  const { subSeconds, formatDateToNanoSec } = useFormatting();

  function initializeData(value: any): Object {
    const newData: any = reactive({});
    metrics.forEach((metric) => {
      Vue.set(newData, metric, value);
    });
    return newData;
  }

  function handleMaxValues(data: any, idx: number): number {
    return (
      metricsMetaData[idx].staticAxesRange?.y?.max ||
      Object.values(data).reduce(
        (max: number, dataSet: any) => Math.max(...dataSet, max),
        0
      )
    );
  }

  function getData(start?: Date, end?: Date): void {
    queryReadyState.value = false;

    const currentTimestamp = subSeconds(new Date(), 3);
    const startTime = start
      ? formatDateToNanoSec(start)
      : formatDateToNanoSec(subSeconds(currentTimestamp, 1));
    const endTime = end
      ? formatDateToNanoSec(end)
      : formatDateToNanoSec(currentTimestamp);

    fetchData(startTime, endTime).then((result) => {
      useUpdatingData(result, metrics);
      metrics.forEach((metric, idx) => {
        if (metricsMetaData[idx].fetchType === "modify") {
          // damn backend
          if (!Array.isArray(result)) {
            Object.entries(result).forEach(([id, data]: [string, any]) => {
              handleDataChange(
                id,
                metricsMetaData[idx].transformationService(data),
                metric
              );
            });
          } else {
            result.forEach((data: any) => {
              handleDataChange(
                data.id,
                metricsMetaData[idx].transformationService(
                  data[metricInfo.base],
                  metricInfo.base
                ),
                metric
              );
            });
          }
        } else if (metricsMetaData[idx].fetchType === "read") {
          data[metric] = result;
        }
        Vue.set(data, metric, JSON.parse(JSON.stringify(data[metric])));
        if (metricsMetaData[idx].fetchType === "modify")
          Vue.set(maxValues, metric, handleMaxValues(data[metric], idx));
      });

      const newTimestamps = result[0]?.[metricInfo.base]?.map(
        (entry: any) => entry.timestamp
      ) ?? [formatDateToNanoSec(currentTimestamp)];
      handleTimestamps(
        isInTestMode
          ? [formatDateToNanoSec(subSeconds(currentTimestamp, 1))]
          : newTimestamps
      );
      queryReadyState.value = true;
    });
  }

  function fetchData(start: number, end: number): Promise<any> {
    return new Promise((resolve, reject) => {
      axios
        .get(metricInfo.endpoint, {
          params: {
            startts: start,
            endts: end,
          },
        })
        .then((response) => {
          if (
            metricInfo.component === "QueryTypeProportion" ||
            metricInfo.historic
          ) {
            //TODO: just for debug: adapt response in backend to pass data in body and divided for db instances
            resolve(response.data);
          } else {
            resolve(response.data.body[metricInfo.base]);
          }
        })
        .catch((error) => {
          queryReadyState.value = true;
          reject(error);
        });
    });
  }

  function handleDataChange(
    databaseId: string,
    newData: number[],
    metric: Metric
  ): void {
    if (!data[metric][databaseId]) {
      data[metric][databaseId] = [];
    }
    data[metric][databaseId] = historicFetching.value
      ? handleHistoricDataPoints(newData)
      : handleCurrentDataPoints(data[metric][databaseId], newData);
  }

  function handleTimestamps(newTimestamps: number[]): void {
    const dates = newTimestamps.map(
      (timestamp) => new Date(timestamp / Math.pow(10, 6))
    );
    timestamps.value = historicFetching.value
      ? handleHistoricDataPoints(dates)
      : handleCurrentDataPoints(timestamps.value, dates);
  }

  function handleCurrentDataPoints<T>(data: T[], newData: T[]): T[] {
    const dataCopy = data;
    newData.forEach((entry: T) => {
      if (dataCopy.length > gethistoricRangeSeconds() - 1) {
        dataCopy.shift();
      }
      dataCopy.push(entry);
    });

    return dataCopy;
  }

  function handleHistoricDataPoints<T>(newData: T[]): T[] {
    return newData.slice(
      newData.length - gethistoricRangeSeconds(),
      newData.length - 1
    );
  }

  function getDataIfReady(start?: Date, end?: Date): void {
    historicFetching.value = !!start && !!end;
    if (queryReadyState.value || historicFetching.value) {
      getData(start, end);
    }
  }

  return { data, getDataIfReady, maxValues, timestamps };
}
