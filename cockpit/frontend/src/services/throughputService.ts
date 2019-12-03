import { Ref, ref } from "@vue/composition-api";
import axios from "axios";
import { ThroughputQueryResult } from "../types/throughput";

export function useThroughputFetchService(): {
  getThroughput: (databaseIds: string[]) => void;
  throughputData: { [id: string]: number[] };
  throughputQueryReadyState: Ref<boolean>;
} {
  const throughputQueryReadyState = ref<boolean>(true);
  var throughputData = <{ [id: string]: number[] }>{};

  function getThroughput(databaseIds: string[]): void {
    fetchThroughput().then(result => {
      throughputQueryReadyState.value = false;
      for (let [databaseId, value] of Object.entries(result)) {
        if (databaseIds.includes(databaseId)) {
          addThroughputData(databaseId, value.throughput);
        }
      }
      throughputQueryReadyState.value = true;
    });
  }

  function addThroughputData(dataBaseId: string, data: number): void {
    if (!throughputData[dataBaseId]) {
      throughputData[dataBaseId] = [];
    }
    throughputData[dataBaseId].push(data);
  }

  function fetchThroughput() {
    return Promise.resolve({
      citadelle: { timestamp: 12345, throughput: 12345 },
      auora: { timestamp: 3456, throughput: 3456 }
    });
  }
  // function fetchThroughput(): Promise<ThroughputQueryResult> {
  //   return new Promise((resolve, reject) => {
  //     axios
  //       .get("http://vm-aurora.eaalab.hpi.uni-potsdam.de:5000/throughput")
  //       .then(response => {
  //         resolve(response.data);
  //       })
  //       .catch(error => {
  //         reject(error);
  //       });
  //   });
  // }
  return { getThroughput, throughputQueryReadyState, throughputData };
}
