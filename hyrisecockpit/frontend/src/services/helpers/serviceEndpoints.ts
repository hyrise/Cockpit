const throughputEndpoint = "";
const cpuEndpoint = "";

export function getEndpoint(type: string): string {
  if (type === "throughput") {
    return throughputEndpoint;
  }
  if (type === "cpu") {
    return cpuEndpoint;
  }
}
