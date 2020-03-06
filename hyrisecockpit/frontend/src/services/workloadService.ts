import axios from "axios";
import { Workload } from "@/types/workloads";
import { getTransferredWorkload } from "@/meta/workloads";
import { WorkloadService } from "../types/services";
import { controlBackend } from "../../config";
import { eventBus } from "@/plugins/eventBus";

export function useWorkloadService(): WorkloadService {
  async function getWorkloadData(): Promise<string[]> {
    return axios.get(`${controlBackend}data`);
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
    getWorkloadData,
    loadWorkloadData,
    deleteWorkloadData,
    startWorkload,
    stopWorkload
  };
}
