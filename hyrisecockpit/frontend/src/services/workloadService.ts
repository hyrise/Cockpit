import axios from "axios";
import { Workload } from "@/types/workloads";
import { backendUrl, WorkloadService } from "../types/services";
import { ref } from "@vue/composition-api";

export function useWorkloadService(): WorkloadService {
  function loadWorkloadData(workload: Workload): void {
    axios.post(`${backendUrl}data/${workload}`);
  }
  function deleteWorkloadData(workload: Workload): void {
    axios.delete(`${backendUrl}data/${workload}`);
  }
  return { loadWorkloadData, deleteWorkloadData };
}

export function userKruegerService(): any {
  const data = ref<any>({});
  const queryReadyState = ref<boolean>(true);

  function getKruegerData(): any {
    queryReadyState.value = false;
    axios
      .get(`${backendUrl}krueger_data`)
      .then(response => {
        data.value = transformData(response);
        queryReadyState.value = true;
      })
      .catch(err => {
        queryReadyState.value = true;
      });
  }

  function transformData(response: any): any {
    console.log(response.data);
    response.data.reduce((reuslt, currentValue) => {}, []);
    return response;
  }

  function checkState(): void {
    if (queryReadyState.value) {
      getKruegerData();
    }
  }

  return { data, checkState };
}
