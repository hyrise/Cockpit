import { TransformationService, Base, FetchType } from "./services";

export type ComponentId = "access" | "cpu" | "storage" | "throughput";

export interface ComponentMeta {
  fetchType: FetchType;
  transformationService: TransformationService;
  base: Base;
  endpoint: string;
}

export interface ComponentProps {
  componentMeta: ComponentMeta;
  preselectedDatabaseId: string;
}

export const ComponentPropsValidation = {
  componentMeta: {
    type: Object,
    default: null
  },
  preselectedDatabaseId: {
    type: String,
    default: null
  }
};
