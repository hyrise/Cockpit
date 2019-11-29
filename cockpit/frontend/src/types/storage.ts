export interface StorageQueryResult {
  // TODO refactor to new response type
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
