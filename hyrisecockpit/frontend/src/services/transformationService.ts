import {
  Metric,
  StorageData,
  TreemapDescription,
  AccessData,
} from "../types/metrics";
import { TransformationService } from "@/types/services";
import { useFormatting } from "@/meta/formatting";
import { colorValueDefinition, multiColors } from "@/meta/colors";

const transformationServiceMap: Record<Metric, TransformationService> = {
  access: getAccessData,
  cpu: getCPUData,
  executedQueryTypeProportion: getExecutedQueryTypeProportionData,
  generatedQueryTypeProportion: getGeneratedQueryTypeProportionData,
  latency: getLatencyData,
  memoryFootprint: getMemoryFootprint,
  operatorProportion: getOperatorData,
  queueLength: getReadOnlyData,
  ram: getRAMData,
  storage: getStorageData,
  throughput: getReadOnlyData,
};

const { roundNumber, formatPercentage } = useFormatting();
const {
  getTableMemoryFootprint,
  getDatabaseMemoryFootprint,
} = useDataTransformationHelpers();

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
        color: colorValueDefinition.green,
      },
    },
    {
      x: [type],
      y: [data.SELECT] as number[],
      name: "SELECT",
      type: "bar",
      marker: {
        color: colorValueDefinition.blue,
      },
    },
    {
      x: [type],
      y: [data.INSERT] as number[],
      name: "INSERT",
      type: "bar",
      marker: {
        color: colorValueDefinition.orange,
      },
    },
    {
      x: [type],
      y: [data.DELETE] as number[],
      name: "DELETE",
      type: "bar",
      marker: {
        color: colorValueDefinition.red,
      },
    },
  ];
}

function getCPUData(data: any, primaryKey: string = ""): number[] {
  return data.map((entry: any) => entry[primaryKey].cpu.cpu_process_usage);
}

function getRAMData(data: any, primaryKey: string = ""): number[] {
  return data.map((entry: any) => 100 - entry[primaryKey].memory.percent);
}

function getReadOnlyData(data: any, primaryKey: string = ""): number[] {
  return data.map((entry: any) => entry[primaryKey]);
}

function getLatencyData(data: any, primaryKey: string = ""): number[] {
  return getReadOnlyData(data, primaryKey).map((data: number) =>
    roundNumber(data, Math.pow(10, 6))
  );
}

function getMemoryFootprint(data: any): number[] {
  return [getDatabaseMemoryFootprint(data)];
}

function getStorageData(data: any, primaryKey: string = ""): StorageData {
  //TODO: this can be replaced when the size entry of the returned data of every table is fixed from the backend
  const totalDatabaseMemory = getDatabaseMemoryFootprint(data[primaryKey]);

  const labels: string[] = [primaryKey];
  const parents: string[] = [""];
  const sizes: number[] = [0];
  const descriptions: TreemapDescription[] = [
    {
      size: `${totalDatabaseMemory} MB`,
      encoding: "",
      dataType: "",
      percentOfDatabase: "",
      percentOfTable: "",
    },
  ];

  function getRoundedData(value: number): number {
    return roundNumber(value, 1000, 1 / Math.pow(10, 3), false);
  }

  function getEncodingData(rawData: any): string {
    const totalAmount = rawData.reduce(
      (accumulator: number, currentEncoding: any) =>
        accumulator + currentEncoding.amount,
      0
    );
    return rawData.reduce(
      (
        encodingText: string,
        currentEncoding: any,
        encodingIndex: number,
        encodingArray: [any]
      ) => {
        const compressionText = currentEncoding.compression.reduce(
          (
            text: string,
            compression: string,
            compressionIndex: number,
            compressionArray: [number]
          ) =>
            text +
            compression +
            (compressionIndex === compressionArray.length - 1 ? "" : ",<br>"),
          ""
        );
        return (
          encodingText +
          "<br> " +
          formatPercentage(currentEncoding.amount, totalAmount) +
          "%: " +
          currentEncoding.name +
          "<br> (" +
          compressionText +
          (encodingIndex === encodingArray.length - 1 ? ")" : ")<br>")
        );
      },
      ""
    );
  }

  Object.entries(data[primaryKey]).forEach(
    ([table, tableData]: [string, any]) => {
      labels.push(table);
      parents.push(primaryKey);
      sizes.push(0);
      descriptions.push({
        size: `${getTableMemoryFootprint(tableData.data)} MB`,
        encoding: "",
        dataType: "",
        percentOfDatabase: `${formatPercentage(
          getTableMemoryFootprint(tableData.data),
          totalDatabaseMemory
        )} % of total footprint`,
        percentOfTable: `100 % of ${table}`,
      });
      Object.entries(tableData.data).forEach(
        ([attribute, attributeData]: [string, any]) => {
          labels.push(attribute);
          parents.push(table);
          getRoundedData(attributeData.size);
          sizes.push(getRoundedData(attributeData.size));
          descriptions.push({
            size: `${getRoundedData(attributeData.size)} MB`,
            encoding: `encoding: ${getEncodingData(attributeData.encoding)}`,
            dataType: `data type: ${attributeData.data_type}`,
            percentOfDatabase: `${formatPercentage(
              getRoundedData(attributeData.size),
              totalDatabaseMemory
            )} % of total footprint`,
            percentOfTable: `${formatPercentage(
              getRoundedData(attributeData.size),
              getTableMemoryFootprint(tableData.data)
            )} % of ${table}`,
          });
        }
      );
    }
  );

  return {
    parents,
    labels,
    sizes,
    descriptions,
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
    dataByColumns.forEach((column) => {
      chunk.push(column[i]);
    });
    dataByChunks.push(chunk);
  }
  return { chunks, columns, dataByChunks, descriptions };
}

function getOperatorData(data: any, primaryKey: string = ""): any {
  const operatorData = data.find((entry: any) => entry.id === primaryKey)!;
  const totalTime = operatorData.operator_data.reduce(
    (sum: number, operator: any) => sum + operator.total_time_ns,
    0
  );
  /* combine all entries smaller than 5% */
  const rest: any[] = [];
  const restLabel = {
    x: [""],
    y: [0],
    name: "rest",
    type: "bar",
    text: "",
    hoverinfo: "text",
    marker: { color: colorValueDefinition.lightgrey },
  };

  return operatorData.operator_data
    .reduce((chartData: any[], operator: any, idx: number) => {
      const operatorProportion = (operator.total_time_ns / totalTime) * 100;
      if (operatorProportion < 5) {
        rest.push({ name: operator.operator, size: operatorProportion });
      } else {
        chartData.push({
          x: [""],
          y: [operatorProportion],
          name: operator.operator,
          type: "bar",
          text: `${formatPercentage(operatorProportion, 100)} % - ${
            operator.operator
          } `,
          hoverinfo: "text",
          marker: { color: multiColors[idx] },
        });
      }
      return chartData;
    }, [])
    .sort((operator1: any, operator2: any) => operator2.y[0] - operator1.y[0])
    .concat([
      rest
        .sort(
          (operator1: any, operator2: any) => operator1.size - operator2.size
        )
        .reduce((chartData, operator: any) => {
          return {
            ...chartData,
            y: [chartData.y[0] + operator.size],
            text:
              chartData.text +
              `${formatPercentage(operator.size, 100)} % - ${
                operator.name
              } <br>`,
          };
        }, restLabel),
    ]);
}

export function useMaxValueHelper(
  metric: Metric
): ((data: any) => number) | undefined {
  const maxValueHelper: Partial<Record<Metric, (data: any) => number>> = {
    access: getAccessMaxValue,
  };

  function getAccessMaxValue(data: any): number {
    return Object.values(data).reduce((maxValue: number, dbData: any) => {
      const tableMaxValue = Object.values(dbData).reduce(
        (maxValue: number, tableData: any) => {
          const columnMaxValue = Object.values(tableData).reduce(
            (maxValue: number, columnData: any) =>
              Math.max(...columnData, maxValue),
            0
          );
          return Math.max(maxValue, columnMaxValue);
        },
        0
      );
      return Math.max(maxValue, tableMaxValue);
    }, 0);
  }

  return maxValueHelper[metric];
}

export function useDataTransformationHelpers(): {
  getDatabaseMemoryFootprint: (data: any) => number;
  getTableMemoryFootprint: (data: any) => number;
  getDatabaseMainMemoryCapacity: (data: any) => number;
} {
  function getTableMemoryFootprint(data: any): number {
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
  function getDatabaseMemoryFootprint(data: any): number {
    const memory: number[] = [];
    Object.entries(data).forEach(([table, tableData]: [string, any]) => {
      memory.push(getTableMemoryFootprint(tableData.data));
    });

    return roundNumber(
      memory.reduce((total, tableMemory) => total + tableMemory, 0),
      Math.pow(10, 3),
      Math.pow(10, 3),
      false
    );
  }
  function getDatabaseMainMemoryCapacity(data: any): number {
    return roundNumber(
      data?.memory?.total ?? 0,
      Math.pow(10, 3),
      1 / Math.pow(10, 6),
      false
    );
  }
  return {
    getDatabaseMemoryFootprint,
    getDatabaseMainMemoryCapacity,
    getTableMemoryFootprint,
  };
}
