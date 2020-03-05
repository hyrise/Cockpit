import { Metric } from "../types/metrics";
import { TransformationService } from "@/types/services";

const transformationServiceMap: Record<Metric, TransformationService> = {
  access: getAccessData,
  cpu: getCPUData,
  latency: getReadOnlyData,
  executedQueryTypeProportion: getExecutedQueryTypeProportionData,
  generatedQueryTypeProportion: getGeneratedQueryTypeProportionData,
  queueLength: getReadOnlyData,
  ram: getRAMData,
  storage: getStorageData,
  throughput: getReadOnlyData
};

export function useDataTransformation(metric: Metric): TransformationService {
  return transformationServiceMap[metric];
}

function getExecutedQueryTypeProportionData(
  data: any,
  primaryKey: string = ""
): any {
  const executedQueryTypeProportion = data.find(
    (database: any) => database.id === primaryKey
  ).executed;

  return getQueryTypeProportionData(executedQueryTypeProportion, "executed");
}

function getGeneratedQueryTypeProportionData(
  data: any,
  primaryKey: string = ""
): any {
  const generatedQueryTypeProportion = data.find(
    (database: any) => database.id === primaryKey
  ).generated;

  return getQueryTypeProportionData(generatedQueryTypeProportion, "generated");
}

function getQueryTypeProportionData(data: any, type: string): any {
  return [
    {
      x: [type],
      y: [data.DELETE] as number[],
      name: "DELETE",
      type: "bar"
    },
    {
      x: [type],
      y: [data.INSERT] as number[],
      name: "INSERT",
      type: "bar"
    },
    {
      x: [type],
      y: [data.SELECT] as number[],
      name: "SELECT",
      type: "bar"
    },
    {
      x: [type],
      y: [data.UPDATE] as number[],
      name: "UPDATE",
      type: "bar"
    }
  ];
}

function getCPUData(data: any, primaryKey: string = ""): number {
  return data[primaryKey].cpu.reduce(
    (accumulator: any, currentValue: any) => accumulator + currentValue
  );
}

function getRAMData(data: any, primaryKey: string = ""): number {
  return data[primaryKey].memory.percent;
}

function getReadOnlyData(data: any, primaryKey: string = ""): number {
  return data[primaryKey];
}

function getStorageData(data: any, primaryKey: string = ""): Object {
  //TODO: add type
  const newLabels: string[] = [];
  const newParents: string[] = [];
  const newSizes: number[] = [];
  const newText: Object[] = [];

  const { getDatabaseMemoryFootprint } = useDataTransformationHelpers();

  const totalDatabaseMemory = getDatabaseMemoryFootprint(data[primaryKey]);

  function getRoundedData(value: number): number {
    return Math.floor(value / Math.pow(10, 4)) / 100;
  }

  function getPercentage(part: number, total: number): number {
    return Math.floor((part / total) * Math.pow(10, 4)) / 100;
  }

  newLabels.push(primaryKey);
  newParents.push("");
  newSizes.push(0);
  newText.push({
    size: `${totalDatabaseMemory} MB`,
    encoding: "",
    dataType: "",
    percentOfDatabase: "100% of total footprint",
    percentOfTable: ""
  });
  Object.keys(data[primaryKey]).forEach(table => {
    newLabels.push(table);
    newParents.push(primaryKey);
    newSizes.push(0);
    newText.push({
      size: `${getRoundedData(data[primaryKey][table].size)} MB`,
      encoding: "",
      dataType: "",
      percentOfDatabase: `${getPercentage(
        getRoundedData(data[primaryKey][table].size),
        totalDatabaseMemory
      )} % of total footprint`,
      percentOfTable: `100% of ${table}`
    });
    Object.keys(data[primaryKey][table].data).forEach(attribute => {
      newLabels.push(attribute);
      newParents.push(table);
      getRoundedData(data[primaryKey][table].data[attribute].size);
      newSizes.push(
        getRoundedData(data[primaryKey][table].data[attribute].size)
      );
      newText.push({
        size: `${getRoundedData(
          data[primaryKey][table].data[attribute].size
        )} MB`,
        encoding: `encoding: ${data[primaryKey][table].data[attribute].encoding}`,
        dataType: `data type: ${data[primaryKey][table].data[attribute].data_type}`,
        percentOfDatabase: `${getPercentage(
          getRoundedData(data[primaryKey][table].data[attribute].size),
          totalDatabaseMemory
        )} % of total footprint`,
        percentOfTable: `${getPercentage(
          data[primaryKey][table].data[attribute].size,
          data[primaryKey][table].size
        )} % of ${table}`
      });
    });
  });

  return {
    parents: newParents,
    labels: newLabels,
    sizes: newSizes,
    texts: newText
  };
}

function getAccessData(
  data: any,
  primaryKey: string = "",
  secondaryKey: string = ""
) {
  const dataByColumns: number[][] = [];
  const dataByChunks: number[][] = [];
  const newChunks: string[] = [];
  const newColumns: string[] = [];

  Object.keys(data[primaryKey][secondaryKey]).forEach(column => {
    dataByColumns.push(data[primaryKey][secondaryKey][column]);
    newColumns.push(column);
  });

  const numberOfChunks = dataByColumns[0].length;

  for (let i = 0; i < numberOfChunks; i++) {
    newChunks.push("chunk_" + i);

    const chunk: number[] = [];
    dataByColumns.forEach(column => {
      chunk.push(column[i]);
    });
    dataByChunks.push(chunk);
  }
  return { newChunks, newColumns, dataByChunks };
}

export function useDataTransformationHelpers(): {
  getDatabaseMemoryFootprint: (data: any) => number;
  getDatabaseMainMemoryCapacity: (data: any) => number;
} {
  function getDatabaseMemoryFootprint(data: any): number {
    console.log(data);
    return (
      Math.floor(
        (Object.values(data).reduce(
          (sum1: any, table: any) => sum1 + table.size,
          0
        ) as number) / Math.pow(10, 3)
      ) / 1000
    );
  }
  function getDatabaseMainMemoryCapacity(data: any): number {
    return Math.floor(data.memory.total / Math.pow(10, 6)) / 1000;
  }
  return { getDatabaseMemoryFootprint, getDatabaseMainMemoryCapacity };
}
