import { Ref, ref } from "@vue/composition-api";
import axios from "axios";
import { ThroughputQueryResult } from "../types/throughput";

export function useThroughputFetchService(): {
  getThroughput: () => void;
  throughputData: Ref<number[]>;
  throughputQueryReadyState: Ref<boolean>;
} {
  const throughputQueryReadyState = ref<boolean>(true);
  const throughputData = ref<number[]>([]);

  function getThroughput(): void {
    fetchThroughput().then(result => {
      addThroughputData(result.throughput);
    });
  }

  function addThroughputData(data: number): void {
    throughputQueryReadyState.value = false;
    throughputData.value.push(data);
    throughputQueryReadyState.value = true;
  }

  function fetchThroughput(): Promise<ThroughputQueryResult> {
    return new Promise((resolve, reject) => {
      axios
        .get("http://192.168.30.126:5000/throughput/total")
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          reject(error);
        });
    });
  }
  return { getThroughput, throughputQueryReadyState, throughputData };
}
