const throughputEndpoint = "";
const cpuEndpoint = "";
const databaseEndpoint = "";

export function getEndpoint(type: string): string {
  if (type === "throughput") {
    return throughputEndpoint;
  }
  if (type === "cpu") {
    return cpuEndpoint;
  }
  if(type === "database"){
    return databaseEndpoint;
  }
}
