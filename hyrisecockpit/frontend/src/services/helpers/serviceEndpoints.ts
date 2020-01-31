const backendUrl = "http://vm-aurora.eaalab.hpi.uni-potsdam.de:8000/";

const cpuBase = "system_data";
const throughputBase = "throughput";
const databaseBase = "database";
const storageBase = "storage";

export function getEndpoint(type: string): string {
  if (type === "throughput") {
    return backendUrl + throughputBase;
  }
  if (type === "cpu") {
    return backendUrl + cpuBase;
  }
  if (type === "database") {
    return backendUrl + databaseBase;
  }
  if (type === "storage") {
    return backendUrl + storageBase;
  }
}

export function getBase(type: string): string {
  if (type === "throughput") {
    return throughputBase;
  }
  if (type === "cpu") {
    return cpuBase;
  }
}
