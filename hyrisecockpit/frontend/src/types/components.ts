import { TransformationService, Base, FetchType } from "./services";

export type ComponentId = "access" | "cpu" | "storage" | "throughput";

export interface Component {
  fetchType: FetchType;
  transformationService: TransformationService;
  base: Base;
  endpoint: string;
}

export interface ComponentProps {
  preselectedDatabaseId: string;
}

export const ComponentPropsValidation = {
  preselectedDatabaseId: {
    type: String,
    default: null
  }
};
