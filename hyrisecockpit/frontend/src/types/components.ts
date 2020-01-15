import { TransformationService } from "./services";
import { useDataTransformation } from "../services/transformationService";

const backendUrl = "http://vm-aurora.eaalab.hpi.uni-potsdam.de:8000/";

export type ComponentId = "access" | "cpu" | "storage" | "throughput";

export type FetchType = "read" | "modify";

export type Base = "system_data" | "throughput" | "storage" | "chunks_data";

export interface Component {
  fetchType: FetchType;
  transformationService: TransformationService;
  base: Base;
  endpoint: string;
}

export const componentMap: Record<ComponentId, Component> = {
  access: {
    fetchType: "read",
    transformationService: useDataTransformation("access"),
    base: "chunks_data",
    endpoint: backendUrl + "chunks_data"
  },
  cpu: {
    fetchType: "modify",
    transformationService: useDataTransformation("cpu"),
    base: "system_data",
    endpoint: backendUrl + "system_data"
  },
  storage: {
    fetchType: "read",
    transformationService: useDataTransformation("storage"),
    base: "storage",
    endpoint: backendUrl + "storage"
  },
  throughput: {
    fetchType: "modify",
    transformationService: useDataTransformation("throughput"),
    base: "throughput",
    endpoint: backendUrl + "throughput"
  }
};
