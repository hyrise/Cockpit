import { Ref, ref } from '@vue/composition-api';
import axios from 'axios';
import { ThroughputQueryResult, ThroughputData } from '../types/throughput';

export function useThroughputFetchService(
  onChange: () => void,
): {
  getThroughput: (databaseIds: string[]) => void;
  throughputData: Ref<ThroughputData>;
  throughputQueryReadyState: Ref<boolean>;
} {
  const throughputQueryReadyState = ref<boolean>(true);
  var throughputData = ref<ThroughputData>({});

  function getThroughput(databaseIds: string[]): void {
    fetchThroughput().then(result => {
      throughputQueryReadyState.value = false;
      Object.keys(result).forEach(key => {
        if (databaseIds.includes(key)) {
          addThroughputData(key, result[key][1]);
        }
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
      resolve({
        citadelle: [1234, 123],
        york: [1234, 12],
      });
      // add backend link here
      //
      //
      // axios
      //   .get("http://vm-aurora.eaalab.hpi.uni-potsdam.de:5000/throughput")
      //   .then(response => {
      //     resolve(response.data);
      //   })
      //   .catch(error => {
      //     reject(error);
      //   });
    });
  }
  return { getThroughput, throughputQueryReadyState, throughputData };
}
