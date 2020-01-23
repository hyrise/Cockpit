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
    axios.post(`${backendUrl}data/${workload}`); // TODO: get backend URL (endpoint) and insert here
  }
  function stopWorkload(workload: Workload): void {
    axios.post(`${backendUrl}data/${workload}`); // TODO: get backend URL (endpoint) and insert here
  }

  return { loadWorkloadData, deleteWorkloadData, startWorkload, stopWorkload };
}
