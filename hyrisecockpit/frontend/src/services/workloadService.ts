import { ref } from "@vue/composition-api";
import axios from "axios";
import { Workload } from "@/types/workloads";
import { backendUrl, WorkloadService } from "../types/services";

export function useWorkloadService(): WorkloadService {
  function loadWorkloadData(workload: Workload): void {
    axios.post(`${backendUrl}data/${workload}`);
  }
  function deleteWorkloadData(workload: Workload): void {
    axios.delete(`${backendUrl}data/${workload}`);
  }
  return { loadWorkloadData, deleteWorkloadData };
}
