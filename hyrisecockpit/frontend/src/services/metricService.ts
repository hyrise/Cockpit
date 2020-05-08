import { ref, reactive, computed } from "@vue/composition-api";
import axios from "axios";
import { Metric } from "@/types/metrics";
import { MetricService } from "@/types/services";
import { useUpdatingData } from "../meta/components";
import { getMetricMetadata } from "../meta/metrics";
import { useFormatting } from "@/meta/formatting";
import { isInTestMode } from "../../config";
import Vue from "vue";
import { useMaxValueHelper } from "./transformationService";
import { StaticRange } from "@/controller/metricController";

// fetch data for all metrics with same endpoint
export function useMetricService(metrics: Metric[]): MetricService {
  const queryReadyState = ref(true);
  const data: any = initializeData({});
  const timestamps = ref<Date[]>([]);
  const metricsMetaData = metrics.map((metric) => getMetricMetadata(metric));
  const metricInfo = metricsMetaData[0];
  const maxValues = initializeData(0) as Record<Metric, number>;
  const historicFetching = ref(false);
  const range = computed(
    (): number => Vue.prototype.$selectionController.selectedRange.value
  );
  const precision = computed(
    (): number => Vue.prototype.$selectionController.selectedPrecision.value
  );

  const {
    addSeconds,
    subSeconds,
    formatDateToNanoSec,
    getNanoSeconds,
  } = useFormatting();

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

  function getData(staticRange?: StaticRange): void {
    queryReadyState.value = false;

    const currentTimestamp = subSeconds(new Date(), 3);
    const startTime = formatDateToNanoSec(
      staticRange
        ? staticRange.startDate
        : subSeconds(
            currentTimestamp,
            historicFetching.value ? range.value : precision.value
          )
    );
    const endTime = formatDateToNanoSec(
      staticRange
        ? staticRange.endDate
        : historicFetching.value
        ? addSeconds(currentTimestamp, precision.value + 3)
        : currentTimestamp
    );

    fetchData(startTime, endTime, staticRange).then((result) => {
      useUpdatingData(result, metrics);
      metrics.forEach((metric, idx) => {
        if (metricsMetaData[idx].fetchType === "modify") {
          // damn backend
          if (!Array.isArray(result)) {
            Object.entries(result).forEach(([id, data]: [string, any]) => {
              handleDataChange(
                id,
                metricsMetaData[idx].transformationService(data),
                metric,
                !!staticRange
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
                metric,
                !!staticRange
              );
            });
          }
        } else if (metricsMetaData[idx].fetchType === "read") {
          data[metric] = result;
        }
        Vue.set(data, metric, JSON.parse(JSON.stringify(data[metric])));
        if (metricsMetaData[idx].fetchType === "modify") {
          Vue.set(maxValues, metric, handleMaxValues(data[metric], idx));
        } else {
          const getMaxValue = useMaxValueHelper(metric);
          if (getMaxValue) Vue.set(maxValues, metric, getMaxValue(result));
        }
      });

      const newTimestamps = result[0]?.[metricInfo.base]?.map(
        (entry: any) => entry.timestamp
      ) ?? [formatDateToNanoSec(currentTimestamp)];
      handleTimestamps(
        isInTestMode
          ? [formatDateToNanoSec(subSeconds(currentTimestamp, 1))]
          : newTimestamps,
        !!staticRange
      );
      queryReadyState.value = true;
    });
  }

  function fetchData(
    start: number,
    end: number,
    staticRange?: StaticRange
  ): Promise<any> {
    return new Promise((resolve, reject) => {
      axios
        .get(metricInfo.endpoint, {
          params: {
            startts: start,
            endts: end,
            precision: getNanoSeconds(
              staticRange ? staticRange.precision : precision.value
            ),
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
    metric: Metric,
    all: boolean
  ): void {
    if (!data[metric][databaseId]) {
      data[metric][databaseId] = [];
    }
    data[metric][databaseId] = historicFetching.value
      ? handleHistoricDataPoints(newData, all)
      : handleCurrentDataPoints(data[metric][databaseId], newData);
  }

  function handleTimestamps(newTimestamps: number[], all: boolean): void {
    const dates = newTimestamps.map(
      (timestamp) => new Date(timestamp / Math.pow(10, 6))
    );
    timestamps.value = historicFetching.value
      ? handleHistoricDataPoints(dates, all)
      : handleCurrentDataPoints(timestamps.value, dates);
  }

  function handleCurrentDataPoints<T>(data: T[], newData: T[]): T[] {
    const dataCopy = data;
    newData.forEach((entry: T) => {
      if (dataCopy.length > range.value - 1) {
        dataCopy.shift();
      }
      dataCopy.push(entry);
    });

    return dataCopy;
  }

  function handleHistoricDataPoints<T>(newData: T[], all = false): T[] {
    return all
      ? newData
      : newData.slice(newData.length - range.value, newData.length - 1);
  }

  function getDataIfReady(refetch: boolean = false, range?: StaticRange): void {
    historicFetching.value = refetch;
    if (queryReadyState.value || historicFetching.value) {
      getData(range);
    }
  }

  return { data, getDataIfReady, maxValues, timestamps };
}
