import {
  Metric,
  StorageData,
  TreemapDescription,
  AccessData
} from "../types/metrics";
import { TransformationService } from "@/types/services";
import { useFormatting } from "@/meta/formatting";
import { colorDefinition } from "@/meta/colors";

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
        color: colorDefinition.green
      }
    },
    {
      x: [type],
      y: [data.SELECT] as number[],
      name: "SELECT",
      type: "bar",
      marker: {
        color: colorDefinition.blue
      }
    },
    {
      x: [type],
      y: [data.INSERT] as number[],
      name: "INSERT",
      type: "bar",
      marker: {
        color: colorDefinition.orange
      }
    },
    {
      x: [type],
      y: [data.DELETE] as number[],
      name: "DELETE",
      type: "bar",
      marker: {
        color: colorDefinition.red
      }
    }
  ];
}

function getCPUData(data: any, primaryKey: string = ""): number[] {
  return data.map((entry: any) => entry[primaryKey].cpu.cpu_process_usage);
}

function getRAMData(data: any, primaryKey: string = ""): number[] {
  return data.map((entry: any) => entry[primaryKey].memory.percent);
}

function getReadOnlyData(data: any, primaryKey: string = ""): number[] {
  return data.map((entry: any) => entry[primaryKey]);
}

function getLatencyData(data: any, primaryKey: string = ""): number[] {
  return getReadOnlyData(data, primaryKey).map((data: number) =>
    roundNumber(data, Math.pow(10, 6))
  );
}

function getStorageData(data: any, primaryKey: string = ""): StorageData {
  const {
    getTableMemoryFootprint,
    getDatabaseMemoryFootprint
  } = useDataTransformationHelpers();

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
      percentOfDatabase: "100% of total footprint",
      percentOfTable: ""
    }
  ];

  function getRoundedData(value: number): number {
    return roundNumber(value, 1000, 1 / Math.pow(10, 3), false);
  }

  function getPercentage(part: number, total: number): number {
    return roundNumber(part / total, 100, Math.pow(10, 4), false);
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
          getPercentage(currentEncoding.amount, totalAmount) +
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
        percentOfDatabase: `${getPercentage(
          getTableMemoryFootprint(tableData.data),
          totalDatabaseMemory
        )} % of total footprint`,
        percentOfTable: `100 % of ${table}`
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
            percentOfDatabase: `${getPercentage(
              getRoundedData(attributeData.size),
              totalDatabaseMemory
            )} % of total footprint`,
            percentOfTable: `${getPercentage(
              getRoundedData(attributeData.size),
              getTableMemoryFootprint(tableData.data)
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
    getTableMemoryFootprint
  };
}

export function usePluginTransformationSevice(): any {
  const { formatDateToHHMMSS } = useFormatting();

  function getActivePluginData(data: any): any {
    return data.reduce((result: string[], currentDatabase: any) => {
      return currentDatabase.plugins
        ? [
          ...result,
          ...currentDatabase.plugins.map(
            (plugin: string) =>
              currentDatabase.id + "_" + plugin.replace("Plugin", "")
          )
        ]
        : result;
    }, []);
  }

  function getPluginLogsData(data: any): any {
    return data.reduce((result: any, currentDatabase: any) => {
      result[currentDatabase.id] = currentDatabase.plugin_log.reduce(
        (databaseLog: string, currentLog: any) => {
          return (
            databaseLog +
            `${currentLog.reporter} [${formatDateToHHMMSS(
              new Date(parseInt(currentLog.timestamp))
            )}]: ${currentLog.message}\n`
          );
        },
        ""
      );
      return result;
    }, {});
  }

  function getPluginSettingsData(data: any): any {
    return data.reduce((result: any, currentDatabase: any) => {
      const allDatabaseSettings =
        currentDatabase.plugin_settings &&
        currentDatabase.plugin_settings.reduce(
          (allSettings: any, currentSetting: any) => {
            const pluginName = currentSetting.name.substring(
              0,
              currentSetting.name.indexOf("Plugin")
            );
            allSettings[pluginName]
              ? (allSettings[pluginName] = [
                ...allSettings[pluginName],
                currentSetting
              ])
              : (allSettings[pluginName] = [currentSetting]);
            return allSettings;
          },
          {}
        );
      result[currentDatabase.id] = allDatabaseSettings;
      return result;
    }, {});
  }

  return {
    getActivePluginData,
    getPluginLogsData,
    getPluginSettingsData
  };
}
