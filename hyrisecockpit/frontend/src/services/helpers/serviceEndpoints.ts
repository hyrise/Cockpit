const backendUrl = "http://vm-aurora.eaalab.hpi.uni-potsdam.de:8000/";

const baseMap = {
  cpu: "system_data",
  throughput: "throughput",
  storage: "storage",
  access: "chunks_data",
  database: "database"
};

export function getEndpoint(type: string): string {
  return backendUrl + (baseMap as any)[type]; // refactor with type
}

export function getBase(type: string): string {
  return (baseMap as any)[type];
}
