import { Metric, StorageData, TreemapDescription } from "../types/metrics";
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

function getStorageData(data: any, primaryKey: string = ""): StorageData {
  const { getDatabaseMemoryFootprint } = useDataTransformationHelpers();

  const totalDatabaseMemory = getDatabaseMemoryFootprint(data[primaryKey]);
  const labels: string[] = [primaryKey];
  const parents: string[] = [""];
  const sizes: number[] = [0];
  const descriptions: TreemapDescription[] = [
    {
      size: `${totalDatabaseMemory} MB`,
      encoding: "",
      dataType: "",
      percentOfDatabase: "100% of total footprint",
      percentOfTable: ""
    }
  ];

  function getRoundedData(value: number): number {
    return Math.floor(value / Math.pow(10, 4)) / 100;
  }

  function getPercentage(part: number, total: number): number {
    return Math.floor((part / total) * Math.pow(10, 4)) / 100;
  }

  Object.entries(data[primaryKey]).forEach(
    ([table, tableData]: [string, any]) => {
      labels.push(table);
      parents.push(primaryKey);
      sizes.push(0);
      descriptions.push({
        size: `${getRoundedData(tableData.size)} MB`,
        encoding: "",
        dataType: "",
        percentOfDatabase: `${getPercentage(
          getRoundedData(tableData.size),
          totalDatabaseMemory
        )} % of total footprint`,
        percentOfTable: `100% of ${table}`
      });
      Object.entries(tableData.data).forEach(
        ([attribute, attributeData]: [string, any]) => {
          labels.push(attribute);
          parents.push(table);
          getRoundedData(attributeData.size);
          sizes.push(getRoundedData(attributeData.size));
          descriptions.push({
            size: `${getRoundedData(attributeData.size)} MB`,
            encoding: `encoding: ${attributeData.encoding}`,
            dataType: `data type: ${attributeData.data_type}`,
            percentOfDatabase: `${getPercentage(
              getRoundedData(attributeData.size),
              totalDatabaseMemory
            )} % of total footprint`,
            percentOfTable: `${getPercentage(
              attributeData.size,
              tableData.size
            )} % of ${table}`
          });
        }
      );
    }
  );

  return {
    parents,
    labels,
    sizes,
    descriptions
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
