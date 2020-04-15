import { ref, computed, reactive, watch } from "@vue/composition-api";
import axios from "axios";
import { Metric } from "@/types/metrics";
import { MetricService } from "@/types/services";
import { useUpdatingData } from "../meta/components";
import { getMetricMetadata } from "../meta/metrics";
import { useFormatting } from "@/meta/formatting";
import { isInTestMode } from "@/helpers/methods";
import Vue from "vue";

// fetch data for all metrics with same endpoint
export function useMetricService(metrics: Metric[]): MetricService {
  const queryReadyState = ref(true);
  let data: any = initializeData();
  console.log("init data");
  const timestamps = ref<Date[]>([]);
  const metricsMetaData = metrics.map(metric => getMetricMetadata(metric));
  const metricInfo = metricsMetaData[0];
  const maxValues = computed(
    (): Record<Metric, number> => {
      const newValues: Record<Metric, number> = {} as Record<Metric, number>;
      metrics.forEach((metric, idx) => {
        newValues[metric] =
          metricsMetaData[idx].staticAxesRange?.y?.max ||
          Object.values(data[metric]).reduce(
            (max: number, dataSet: any) => Math.max(...dataSet, max),
            0
          );
      });
      return newValues;
    }
  );
  const historicFetching = ref(false);

  const { subSeconds, formatDateToNanoSec } = useFormatting();

  function initializeData(): Object {
    const newData: any = reactive({});
    metrics.forEach(metric => {
      Vue.set(newData, metric, {});
    });
    return newData;
  }

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
      useUpdatingData(result, metrics);
      metrics.forEach((metric, idx) => {
        if (metricsMetaData[idx].fetchType === "modify") {
          console.log("added");
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
        } else if (metricsMetaData[idx].fetchType === "read") {
          Vue.set(data, metric, result);
        }
        const dataCopy = JSON.parse(JSON.stringify(data[metric]));
        Vue.set(data, metric, dataCopy);
      });

      const newTimestamps = result[0]?.[metricInfo.base]?.map(
        (entry: any) => entry.timestamp
      ) ?? [formatDateToNanoSec(currentTimestamp)];
      handleTimestamps(
        isInTestMode ? [formatDateToNanoSec(currentTimestamp)] : newTimestamps
      );
      queryReadyState.value = true;
    });
  }

  watch(
    () => maxValues.value,
    () => console.log("max", maxValues.value)
  );

  function fetchData(start: number, end: number): Promise<any> {
    return new Promise((resolve, reject) => {
      axios
        .get(metricInfo.endpoint, {
          params: {
            startts: start,
            endts: end
          }
        })
        .then(response => {
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
        .catch(error => {
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

  return { data, getDataIfReady, maxValues, timestamps };
}
