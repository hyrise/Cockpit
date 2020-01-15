import { Ref } from "@vue/composition-api";

export interface FetchService {
  data: Ref<any>; // refactor type
  checkState: () => void;
}

export type TransformationService = (
  data: any,
  primaryKey?: string,
  secondaryKey?: string
) => any;
