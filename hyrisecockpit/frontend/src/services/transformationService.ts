import {
  Metric,
  StorageData,
  TreemapDescription,
  AccessData
} from "../types/metrics";
import { TransformationService } from "@/types/services";
import { useFormatting } from "@/meta/formatting";
import { getColor } from "@/meta/colors";

const transformationServiceMap: Record<Metric, TransformationService> = {
  access: getAccessData,
  cpu: getCPUData,
  latency: getLatencyData,
  executedQueryTypeProportion: getExecutedQueryTypeProportionData,
  generatedQueryTypeProportion: getGeneratedQueryTypeProportionData,
  queueLength: getReadOnlyData,
  ram: getRAMData,
  storage: getStorageData,
  throughput: getReadOnlyData
};

const { roundNumber } = useFormatting();

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
      y: [data.UPDATE] as number[],
      name: "UPDATE",
      type: "bar",
      marker: {
        color: getColor(2)
      }
    },
    {
      x: [type],
      y: [data.SELECT] as number[],
      name: "SELECT",
      type: "bar",
      marker: {
        color: getColor(0)
      }
    },
    {
      x: [type],
      y: [data.INSERT] as number[],
      name: "INSERT",
      type: "bar",
      marker: {
        color: getColor(1)
      }
    },
    {
      x: [type],
      y: [data.DELETE] as number[],
      name: "DELETE",
      type: "bar",
      marker: {
        color: getColor(3)
      }
    }
  ];
}

function getCPUData(data: any, primaryKey: string = ""): number {
  return data[primaryKey].cpu.cpu_process_usage;
}

function getRAMData(data: any, primaryKey: string = ""): number {
  return data[primaryKey].memory.percent;
}

function getReadOnlyData(data: any, primaryKey: string = ""): number {
  return data[primaryKey];
}

function getLatencyData(data: any, primaryKey: string = ""): number {
  return roundNumber(getReadOnlyData(data, primaryKey), Math.pow(10, 6));
}

function getStorageData(data: any, primaryKey: string = ""): StorageData {
  const { getDatabaseMemoryFootprint } = useDataTransformationHelpers();

  //TODO: this can be replaced when the size entry of the returned data of every table is fixed from the backend
  const memory: number[] = [];
  Object.entries(data[primaryKey]).forEach(
    ([table, tableData]: [string, any]) => {
      memory.push(getDatabaseMemoryFootprint(tableData.data));
    }
  );
  const totalDatabaseMemory = roundNumber(
    memory.reduce((total, tableMemory) => total + tableMemory, 0),
    100,
    100,
    false
  );

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
    return roundNumber(value, 100, 1 / Math.pow(10, 4), false);
  }

  function getPercentage(part: number, total: number): number {
    return roundNumber(part / total, 100, Math.pow(10, 4), false);
  }

  Object.entries(data[primaryKey]).forEach(
    ([table, tableData]: [string, any]) => {
      labels.push(table);
      parents.push(primaryKey);
      sizes.push(0);
      descriptions.push({
        size: `${getDatabaseMemoryFootprint(tableData.data)} MB`,
        encoding: "",
        dataType: "",
        percentOfDatabase: `${getPercentage(
          getDatabaseMemoryFootprint(tableData.data),
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
              getRoundedData(attributeData.size),
              getDatabaseMemoryFootprint(tableData.data)
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
): AccessData {
  const dataByColumns: number[][] = [];
  const dataByChunks: number[][] = [];
  const chunks: string[] = [];
  const columns: string[] = [];
  const descriptions: string[][] = [];

  const availableColumns: string[] = [];

  Object.entries(data[primaryKey][secondaryKey]).forEach(
    ([column, columnData]: [string, any]) => {
      dataByColumns.push(columnData);
      columns.push(truncateColumnName(column));
      availableColumns.push(column);
    }
  );

  const numberOfChunks = dataByColumns[0].length;

  function truncateColumnName(column: string): string {
    return column.length > 7 ? column.substring(0, 7) + ".." : column;
  }

  for (let i = 0; i < numberOfChunks; i++) {
    chunks.push("Nr. " + i);
    descriptions.push(availableColumns);

    const chunk: number[] = [];
    dataByColumns.forEach(column => {
      chunk.push(column[i]);
    });
    dataByChunks.push(chunk);
  }
  return { chunks, columns, dataByChunks, descriptions };
}

export function useDataTransformationHelpers(): {
  getDatabaseMemoryFootprint: (data: any) => number;
  getDatabaseMainMemoryCapacity: (data: any) => number;
} {
  function getDatabaseMemoryFootprint(data: any): number {
    return roundNumber(
      Object.values(data).reduce(
        (sum1: number, table: any) => sum1 + table.size,
        0
      ),
      Math.pow(10, 3),
      1 / Math.pow(10, 3),
      false
    );
  }
  function getDatabaseMainMemoryCapacity(data: any): number {
    return roundNumber(
      data.memory.total,
      Math.pow(10, 3),
      1 / Math.pow(10, 6),
      false
    );
  }
  return { getDatabaseMemoryFootprint, getDatabaseMainMemoryCapacity };
}
