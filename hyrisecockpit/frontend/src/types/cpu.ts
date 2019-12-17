import { QueryData } from './queryData'

export interface CPUData extends QueryData {
}

export interface CPUQueryResult {
  [id: string]: number[];
}
