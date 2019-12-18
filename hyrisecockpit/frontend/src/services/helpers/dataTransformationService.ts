export function useDataTransformation(
  dataType: string
): (data: any, key: string) => number {
  function transformCPUData(data: any, key: string): number {
    return data[key].cpu.reduce(
      (accumulator, currentValue) => accumulator + currentValue
    );
  }
  function transformThroughputData(data: any, key: string): number {
    return data.throughput[key][1];
  }

  if (dataType === "cpu") {
    return transformCPUData;
  }
  if (dataType === "throughput") {
    return transformThroughputData;
  }
  return transformThroughputData;
}
