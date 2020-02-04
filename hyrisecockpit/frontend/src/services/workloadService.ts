import axios from "axios";
import { Workload, WorkloadMetaData } from "@/types/workloads";
import { WorkloadService } from "../types/services";
import { ref } from "@vue/composition-api";
import { FetchService } from "@/types/services";

import { monitorBackend, controlBackend } from "../../config";

export function useWorkloadService(): WorkloadService {
  function loadWorkloadData(workload: Workload): void {
    axios.post(`${controlBackend}data/${workload}`);
  }
  function deleteWorkloadData(workload: Workload): void {
    axios.delete(`${controlBackend}data/${workload}`);
  }

  function startWorkload(workloadMetaData: WorkloadMetaData): void {
    axios.post(`${controlBackend}workload`, {
      workloadMetaData
    });
  }

  function stopWorkload(): void {
    axios.delete(`${controlBackend}workload`);
  }

  return {
    loadWorkloadData,
    deleteWorkloadData,
    startWorkload,
    stopWorkload
  };
}

export function useKruegerService(): FetchService {
  const data = ref<any>([]);
  const queryReadyState = ref<boolean>(true);

  function getKruegerData(): any {
    queryReadyState.value = false;
    axios
      .get(`${monitorBackend}krueger_data`)
      .then(response => {
        data.value = transformData(response);
        const dataCopy = JSON.parse(JSON.stringify(data.value));
        data.value = dataCopy;
        queryReadyState.value = true;
      })
      .catch(err => {
        queryReadyState.value = true;
      });
  }

  function transformData(response: any): any {
    let newData = [
      {
        x: [] as string[],
        y: [] as number[],
        name: "DELETE",
        type: "bar"
      },
      {
        x: [] as string[],
        y: [] as number[],
        name: "INSERT",
        type: "bar"
      },
      {
        x: [] as string[],
        y: [] as number[],
        name: "SELECT",
        type: "bar"
      },
      {
        x: [] as string[],
        y: [] as number[],
        name: "UPDATE",
        type: "bar"
      }
    ];
    for (let [workload, query] of Object.entries(response.data)) {
      for (let [queryType, amount] of Object.entries(query as any)) {
        var dataSet = newData.find(x => x.name === queryType);
        if (dataSet) {
          dataSet.x = [...dataSet.x, workload];
          dataSet.y = [...dataSet.y, amount as number];
        }
      }
    }
    return newData;
  }

  function checkState(): void {
    if (queryReadyState.value) {
      getKruegerData();
    }
  }

  return { data, checkState };
}
