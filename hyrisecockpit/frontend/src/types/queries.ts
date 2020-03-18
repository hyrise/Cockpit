export type DetailedQueryInformation = {
  queryName: string;
  workloadType: string;
  latency: number;
  throughput: number;
};

export type DisplayedQueryInformation = {
  queryName: string;
  workloadType: string;
  latency: string;
  throughput: number;
};
