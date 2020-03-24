import axios from "axios";
import { Workload } from "@/types/workloads";
import { getTransferredWorkload } from "@/meta/workloads";
import { WorkloadService } from "../types/services";
import { controlBackend, monitorBackend } from "../../config";

export function useWorkloadService(): WorkloadService {
  async function getLoadedWorkloadData(): Promise<string[]> {
    return axios.get(`${monitorBackend}status`);
  }
  async function loadWorkloadData(workload: Workload): Promise<void> {
    axios.post(`${controlBackend}data`, {
      folder_name: getTransferredWorkload(workload)
    });
  }
  async function deleteWorkloadData(workload: Workload): Promise<void> {
    axios.delete(`${controlBackend}data`, {
      data: {
        folder_name: getTransferredWorkload(workload)
      }
    });
  }

  async function startWorkload(
    workload: Workload,
    frequency: number
  ): Promise<void> {
    return axios.post(`${controlBackend}workload`, {
      folder_name: getTransferredWorkload(workload),
      frequency: frequency
    });
  }
  async function stopWorkload(): Promise<void> {
    axios.delete(`${controlBackend}workload`);
  }

  return {
    getLoadedWorkloadData,
    loadWorkloadData,
    deleteWorkloadData,
    startWorkload,
    stopWorkload
  };
}
