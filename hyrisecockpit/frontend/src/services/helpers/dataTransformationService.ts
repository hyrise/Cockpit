export function useDataTransformation(
  dataType: string
): (data: any, primaryKey?: string, secondaryKey?: string) => any {
  function transformCPUData(
    data: any,
    primaryKey: string = "",
    secondaryKey: string = ""
  ): number {
    return data[primaryKey].cpu.reduce(
      (accumulator: any, currentValue: any) => accumulator + currentValue
    );
  }
  function transformThroughputData(
    data: any,
    primaryKey: string = "",
    secondaryKey: string = ""
  ): number {
    return data.throughput[primaryKey][1];
  }

  function transformStorageData(
    data: any,
    primaryKey: string = "",
    secondaryKey: string = ""
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

  function transformAccessData(
    data: any,
    primaryKey: string = "",
    secondaryKey: string = ""
  ) {
    const dataByColumns: number[][] = [];
    const dataByChunks: number[][] = [];
    const localChunks: string[] = [];
    const localColumns: string[] = [];

    Object.keys(data[primaryKey][secondaryKey]).forEach(column => {
      dataByColumns.push(data[primaryKey][secondaryKey][column]);
      localColumns.push(column);
    });

    const numberOfChunks = dataByColumns[0].length;

    for (let i = 0; i < numberOfChunks; i++) {
      localChunks.push("chunk_" + i);

      let chunk: number[] = [];
      dataByColumns.forEach(column => {
        chunk.push(column[i]);
      });
      dataByChunks.push(chunk);
    }
    return { localChunks, localColumns, dataByChunks };
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
  if (dataType === "access") {
    return transformAccessData;
  }
  return transformThroughputData;
}
