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
  function startWorkload(workload: Workload): void {
    axios.post(`${backendUrl}register_workload`, {
      body: {
        type: "tpch",
        factor: 1,
        sf: 1.0,
        shuffle: false,
        "auto-reload": true
      }
    });
    axios.post(`${backendUrl}start_workload`);
  }
  function stopWorkload(workload: Workload): void {
    axios.post(`${backendUrl}stop_workload`);
  }

  return { loadWorkloadData, deleteWorkloadData, startWorkload, stopWorkload };
}
