import { Ref, ref } from "@vue/composition-api";
import axios from "axios";
import { CPUQueryResult, CPUData } from "../types/cpu";

export function useCpuFetchService(
  onChange: () => void
): {
  getCpu: () => void;
  cpuData: Ref<CPUData>;
  cpuQueryReadyState: Ref<boolean>;
} {
  const cpuQueryReadyState = ref<boolean>(true);
  var cpuData = ref<CPUData>({ citadelle: [11, 22, 2], york: [11, 0, 9] });

  function getCpu(): void {
    cpuQueryReadyState.value = false;
    fetchCpu().then(result => {
      Object.keys(result).forEach(key => {
        //addCpuData(key, result[key][1] * 5000);
      });
      if (onChange) {
        onChange();
      }
      cpuQueryReadyState.value = true;
    });
  }

  function addCpuData(dataBaseId: string, data: number): void {
    if (!cpuData.value[dataBaseId]) {
      cpuData.value[dataBaseId] = [];
    }
    cpuData.value[dataBaseId].push(data);
  }

  function fetchCpu(): Promise<CPUQueryResult> {
    return new Promise((resolve, reject) => {
      axios
        .get("http://vm-aurora.eaalab.hpi.uni-potsdam.de:5000/cpu")
        .then(response => {
          resolve(response.data.body);
        })
        .catch(error => {
          reject(error);
        });
    });
  }
  return { getCpu, cpuQueryReadyState, cpuData };
}
