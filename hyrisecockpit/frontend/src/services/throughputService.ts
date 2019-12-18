import { Ref, ref } from "@vue/composition-api";
import axios from "axios";
import { ThroughputQueryResult, ThroughputData } from "../types/throughput";

export function useThroughputFetchService(
  onChange: () => void
): {
  getThroughput: () => void;
  throughputData: Ref<ThroughputData>;
  throughputQueryReadyState: Ref<boolean>;
} {
  const throughputQueryReadyState = ref<boolean>(true);
  var throughputData = ref<ThroughputData>({});

  function getThroughput(): void {
    throughputQueryReadyState.value = false;
    fetchThroughput().then(result => {
      Object.keys(result).forEach(key => {
        addThroughputData(key, result[key]);
      });
      if (onChange) {
        onChange();
      }
      throughputQueryReadyState.value = true;
    });
  }

  function addThroughputData(dataBaseId: string, data: number): void {
    if (!throughputData.value[dataBaseId]) {
      throughputData.value[dataBaseId] = [];
    }
    throughputData.value[dataBaseId].push(data);
  }

  function fetchThroughput(): Promise<ThroughputQueryResult> {
    return new Promise((resolve, reject) => {
      axios
        .get("http://vm-aurora.eaalab.hpi.uni-potsdam.de:8000/throughput")
        .then(response => {
          console.log(response);
          resolve(response.data.body.throughput);
        })
        .catch(error => {
          reject(error);
        });
    });
  }
  return { getThroughput, throughputQueryReadyState, throughputData };
}
