import { Metric } from "../types/metrics";
import { TransformationService } from "@/types/services";
import Vue from "vue";
import { equals } from "../helpers/methods";

export function useDataTransformation(metric: Metric): TransformationService {
  const transformationMap: Record<Metric, TransformationService> = {
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

  return transformationMap[metric];
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

function getStorageData(
  data: any,
  primaryKey: string = ""
): { newLabels: string[]; newParents: string[]; newSizes: number[] } {
  const newLabels: string[] = [];
  const newParents: string[] = [];
  const newSizes: number[] = [];

  if (
    !equals(
      Vue.prototype.$databaseService.tables.value,
      Object.keys(data[primaryKey])
    ) &&
    Object.keys(data[primaryKey]).length
  ) {
    Vue.prototype.$databaseService.tables.value = Object.keys(data[primaryKey]);
  }

  Object.keys(data[primaryKey]).forEach(table => {
    newLabels.push(table);
    newParents.push("");
    newSizes.push(0);
    Object.keys(data[primaryKey][table].data).forEach(attribute => {
      newLabels.push(attribute);
      newParents.push(table);
      newSizes.push(data[primaryKey][table].data[attribute].size / 1000000);
    });
  });

  return { newLabels, newParents, newSizes };
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
