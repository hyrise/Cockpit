export interface StorageQueryResult {
  table: string;
  column: string;
  size: number;
  dataType: string;
  encoding: string[];
}

export interface StorageTreemapEntry {
  table: string;
  column: string;
  size: number;
  dataType: string;
  encoding: string;
}
