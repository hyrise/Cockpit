import axios from "axios";
import { Workload, WorkloadMetaData } from "@/types/workloads";
import { WorkloadService } from "../types/services";
import { controlBackend } from "../../config";

export function useWorkloadService(): WorkloadService {
  function loadWorkloadData(workload: Workload): void {
    axios.post(`${controlBackend}data/${workload}`);
  }
  function deleteWorkloadData(workload: Workload): void {
    axios.delete(`${controlBackend}data/${workload}`);
  }

  function startWorkload(workloadMetaData: WorkloadMetaData): void {
    axios.post(`${controlBackend}workload`, workloadMetaData);
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
