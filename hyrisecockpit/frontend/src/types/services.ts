import { Ref } from "@vue/composition-api";
import { Workload } from "./workloads";

export interface FetchService {
  data: Ref<any>;
  checkState: () => void;
}

export type TransformationService = (
  data: any,
  primaryKey?: string,
  secondaryKey?: string
) => any;

export interface WorkloadService {
  loadWorkloadData: (workload: Workload) => void;
  deleteWorkloadData: (workload: Workload) => void;
}

export type FetchType = "read" | "modify";

export type Base =
  | "system_data"
  | "throughput"
  | "storage"
  | "chunks_data"
  | "latency";

const vm = "aurora";
const port = 8000;
export const backendUrl = `http://vm-${vm}.eaalab.hpi.uni-potsdam.de:${port}/`;
