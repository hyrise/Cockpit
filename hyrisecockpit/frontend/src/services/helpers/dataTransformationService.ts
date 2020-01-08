export function useDataTransformation(
  dataType: string
): (data: any, key?: string) => any {
  function transformCPUData(data: any, key: string = ""): number {
    return data[key].cpu.reduce(
      (accumulator: any, currentValue: any) => accumulator + currentValue
    );
  }
  function transformThroughputData(data: any, key: string = ""): number {
    return data[key];
  }

  function transformStorageData(
    data: any,
    key: string = ""
  ): { newLabels: string[]; newParents: string[]; newSizes: number[] } {
    const newLabels: string[] = [];
    const newParents: string[] = [];
    const newSizes: number[] = [];

    Object.keys(data).forEach(instance => {
      newLabels.push(instance);
      newParents.push("");
      newSizes.push(0);
      Object.keys(data[instance]).forEach(table => {
        newLabels.push(instance + "_" + table);
        newParents.push(instance);
        newSizes.push(0);
        Object.keys(data[instance][table].data).forEach(attribute => {
          newLabels.push(instance + "_" + attribute);
          newParents.push(instance + "_" + table);
          newSizes.push(data[instance][table].data[attribute].size);
        });
      });
    });
    return { newLabels, newParents, newSizes };
  }

  if (dataType === "cpu") {
    return transformCPUData;
  }
  if (dataType === "throughput") {
    return transformThroughputData;
  }
  if (dataType === "storage") {
    return transformStorageData;
  }
  return transformThroughputData;
}
