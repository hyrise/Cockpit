import {
  TransformationService,
  Base,
  FetchType,
  backendUrl
} from "../types/services";
import { useDataTransformation } from "../services/transformationService";

export type ComponentId = "access" | "cpu" | "storage" | "throughput";

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
