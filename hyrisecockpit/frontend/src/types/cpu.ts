import { QueryData } from "./genericQueryData";

export interface CPUData extends QueryData {}

export interface CPUQueryResult {
  [id: string]: number[];
}
