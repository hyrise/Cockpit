import axios from "axios";
import { Workload } from "@/types/workloads";
import { getTransferredWorkload } from "@/meta/workloads";
import { WorkloadService } from "../types/services";
import { controlBackend, statusBackend, workloadBackend } from "../../config";

export function useWorkloadService(): WorkloadService {
  async function getLoadedWorkloads(): Promise<string[]> {
    return axios.get(`${statusBackend}benchmark`);
  }
  async function getDatabaseStatus(): Promise<string[]> {
    return axios.get(`${statusBackend}database`);
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

  async function startWorkers(): Promise<void> {
    return axios.post(`${controlBackend}database/worker`);
  }
  async function stopWorkers(): Promise<void> {
    return axios.delete(`${controlBackend}database/worker`);
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
    frequency: number,
    weights: Object
  ): Promise<void> {
    return axios.put(`${workloadBackend}${getTransferredWorkload(workload)}`, {
      folder_name: getTransferredWorkload(workload),
      frequency: frequency,
      weights: weights,
    });
  }
  async function stopWorkload(workload: Workload): Promise<void> {
    return axios.delete(
      `${workloadBackend}${getTransferredWorkload(workload)}`
    );
  }

  return {
    getLoadedWorkloads,
    getDatabaseStatus,
    loadWorkloadData,
    deleteWorkloadData,
    startWorkers,
    stopWorkers,
    getWorkload,
    getWorkloads,
    startWorkload,
    updateWorkload,
    stopWorkload,
  };
}
