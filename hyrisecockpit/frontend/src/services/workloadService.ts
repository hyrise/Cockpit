import axios from "axios";
import { Workload } from "@/types/workloads";
import { getTransferredWorkload } from "@/meta/workloads";
import { WorkloadService } from "../types/services";
import { controlBackend } from "../../config";

export function useWorkloadService(): WorkloadService {
  async function getWorkloadData(): Promise<string[]> {
    return axios.get(`${controlBackend}data`);
  }
  function loadWorkloadData(workload: Workload): void {
    axios.post(`${controlBackend}data/${getTransferredWorkload(workload)}`);
  }
  function deleteWorkloadData(workload: Workload): void {
    axios.delete(`${controlBackend}data/${getTransferredWorkload(workload)}`);
  }

  function startWorkload(workload: Workload, frequency: number): void {
    axios.post(`${controlBackend}workload`, {
      folder_name: getTransferredWorkload(workload),
      frequency: frequency
    });
  }
  function stopWorkload(): void {
    axios.delete(`${controlBackend}workload`);
  }

  return {
    getWorkloadData,
    loadWorkloadData,
    deleteWorkloadData,
    startWorkload,
    stopWorkload
  };
}
