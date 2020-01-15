import { Ref } from "@vue/composition-api";

export interface FetchService {
  data: Ref<any>;
  checkState: () => void;
}

export type TransformationService = (
  data: any,
  primaryKey?: string,
  secondaryKey?: string
) => any;

export type FetchType = "read" | "modify";

export type Base = "system_data" | "throughput" | "storage" | "chunks_data";

const vm = "aurora";
const backendPort = 8000;
export const backendUrl = `http://vm-${vm}.eaalab.hpi.uni-potsdam.de:${backendPort}/`;
