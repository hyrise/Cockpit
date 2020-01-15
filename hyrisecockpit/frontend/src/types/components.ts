import { TransformationService, Base, FetchType } from "./services";

export type ComponentId = "access" | "cpu" | "storage" | "throughput";

export interface Component {
  fetchType: FetchType;
  transformationService: TransformationService;
  base: Base;
  endpoint: string;
}

export interface ComponentProps {
  component: Component;
  preselectedDatabaseId: string;
}

export const ComponentPropsValidation = {
  component: {
    type: Object,
    default: null
  },
  preselectedDatabaseId: {
    type: String,
    default: null
  }
};
