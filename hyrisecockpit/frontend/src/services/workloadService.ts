import axios from "axios";
import { getWorkloadType, getScaleFactor } from "@/meta/workloads";
import { WorkloadService } from "../types/services";
import { controlBackend, statusBackend, workloadBackend } from "../../config";

export function useWorkloadService(): WorkloadService {
  async function getLoadedWorkloads(): Promise<string[]> {
    return axios.get(`${statusBackend}workload_tables`);
  }
  async function getDatabaseStatus(): Promise<string[]> {
    return axios.get(`${statusBackend}database`);
  }

  async function getAllAvailableWorkloads(): Promise<void> {
    return axios.get(`${controlBackend}database/workload_tables`);
  }
  async function loadWorkload(workload: string): Promise<void> {
    return axios.post(`${controlBackend}database/workload_tables`, {
      scale_factor: getScaleFactor(workload),
      workload_type: getWorkloadType(workload),
    });
  }
  async function deleteWorkload(workload: string): Promise<void> {
    return axios.delete(`${controlBackend}database/workload_tables`, {
      data: {
        scale_factor: getScaleFactor(workload),
        workload_type: getWorkloadType(workload),
      },
    });
  }

  async function startWorkers(): Promise<void> {
    return axios.post(`${controlBackend}database/worker`);
  }
  async function stopWorkers(): Promise<void> {
    return axios.delete(`${controlBackend}database/worker`);
  }

  async function getWorkload(workload: string): Promise<void> {
    return axios.get(`${workloadBackend}${getWorkloadType(workload)}`);
  }
  async function getWorkloads(): Promise<void> {
    return axios.get(`${workloadBackend}`);
  }
  async function startWorkload(
    workload: string,
    frequency: number,
    weights: Object
  ): Promise<void> {
    return axios.post(`${workloadBackend}`, {
      scale_factor: getScaleFactor(workload),
      workload_type: getWorkloadType(workload),
      weights: weights,
      frequency: frequency,
    });
  }
  async function stopWorkload(workload: string): Promise<void> {
    return axios.delete(`${workloadBackend}${getWorkloadType(workload)}`);
  }

  return {
    getLoadedWorkloads,
    getDatabaseStatus,
    getAllAvailableWorkloads,
    loadWorkload,
    deleteWorkload,
    startWorkers,
    stopWorkers,
    getWorkload,
    getWorkloads,
    startWorkload,
    stopWorkload,
  };
}
