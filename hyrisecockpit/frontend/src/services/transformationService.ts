import { Metric } from "../types/metrics";
import { TransformationService } from "@/types/services";
import Vue from "vue";
import { notEquals } from "../helpers/methods";

export function useDataTransformation(metric: Metric): TransformationService {
  const transformationMap: Record<Metric, TransformationService> = {
    access: transformAccessData,
    storage: transformStorageData,
    cpu: transformCPUData,
    throughput: getReadOnlyData,
    latency: getReadOnlyData
  };

  return transformationMap[metric];
}

function transformCPUData(data: any, primaryKey: string = ""): number {
  return data[primaryKey].cpu.reduce(
    (accumulator: any, currentValue: any) => accumulator + currentValue
  );
}

function getReadOnlyData(data: any, primaryKey: string = ""): number {
  return data[primaryKey];
}

function transformStorageData(
  data: any,
  primaryKey: string = ""
): { newLabels: string[]; newParents: string[]; newSizes: number[] } {
  const newLabels: string[] = [];
  const newParents: string[] = [];
  const newSizes: number[] = [];

  if (
    notEquals(
      Vue.prototype.$databaseData.tables.value,
      Object.keys(data[primaryKey])
    )
  ) {
    Vue.prototype.$databaseData.tables.value = Object.keys(data[primaryKey]);
  }

  Object.keys(data[primaryKey]).forEach(table => {
    newLabels.push(table);
    newParents.push("");
    newSizes.push(0);
    Object.keys(data[primaryKey][table].data).forEach(attribute => {
      newLabels.push(attribute);
      newParents.push(table);
      newSizes.push(data[primaryKey][table].data[attribute].size);
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
  const newChunks: string[] = [];
  const newColumns: string[] = [];

  Object.keys(data[primaryKey][secondaryKey]).forEach(column => {
    dataByColumns.push(data[primaryKey][secondaryKey][column]);
    newColumns.push(column);
  });

  const numberOfChunks = dataByColumns[0].length;

  for (let i = 0; i < numberOfChunks; i++) {
    newChunks.push("chunk_" + i);

    let chunk: number[] = [];
    dataByColumns.forEach(column => {
      chunk.push(column[i]);
    });
    dataByChunks.push(chunk);
  }
  return { newChunks, newColumns, dataByChunks };
}
