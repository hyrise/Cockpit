import axios from "axios";
import { Workload } from "@/types/workloads";
import { getTransferredWorkload } from "@/meta/workloads";
import { WorkloadService } from "../types/services";
import { controlBackend, monitorBackend, workloadBackend } from "../../config";

export function useWorkloadService(): WorkloadService {
  async function getLoadedWorkloadData(): Promise<string[]> {
    return axios.get(`${monitorBackend}status`);
  }
  async function loadWorkloadData(workload: Workload): Promise<void> {
    return axios.post(`${controlBackend}database/benchmark_tables`, {
      folder_name: getTransferredWorkload(workload),
    });
  }
  async function deleteWorkloadData(workload: Workload): Promise<void> {
    return axios.delete(`${controlBackend}database/benchmark_tables`, {
      data: {
        folder_name: getTransferredWorkload(workload),
      },
    });
  }

  async function getWorkload(workload: Workload): Promise<void> {
    return axios.get(`${workloadBackend}${getTransferredWorkload(workload)}`);
  }
  async function getWorkloads(): Promise<void> {
    return axios.get(`${workloadBackend}`);
  }
  async function startWorkload(
    workload: Workload,
    frequency: number
  ): Promise<void> {
    return axios.post(`${workloadBackend}`, {
      folder_name: getTransferredWorkload(workload),
      frequency: frequency,
    });
  }
  async function updateWorkload(
    workload: Workload,
    frequency: number
  ): Promise<void> {
    return axios.put(`${workloadBackend}${getTransferredWorkload(workload)}`, {
      folder_name: getTransferredWorkload(workload),
      frequency: frequency,
      weights: {},
    });
  }
  async function stopWorkload(workload: Workload): Promise<void> {
    return axios.delete(
      `${workloadBackend}${getTransferredWorkload(workload)}`
    );
  }

  return {
    getLoadedWorkloadData,
    loadWorkloadData,
    deleteWorkloadData,
    getWorkload,
    getWorkloads,
    startWorkload,
    updateWorkload,
    stopWorkload,
  };
}
