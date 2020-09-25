import { isInTestMode } from "../../config";

export function getWorkloadName(
  workloadType: string,
  scaleFactor: string
): string {
  return `${workloadType.toUpperCase()} (SF ${scaleFactor})`;
}
export function getWorkloadType(workloadName: string): string {
  return workloadName.split(" ")[0].toLowerCase();
}
export function getScaleFactor(workloadName: string): string {
  return workloadName.split(" ")[2];
}

export function getTableName(table: string): string {
  const index: number = Math.max(
    table.indexOf("tpch"),
    table.indexOf("tpcds"),
    table.indexOf("tpcc"),
    table.indexOf("job")
  );

  if (isInTestMode || index === -1) return table;

  const words: string[] = table.slice(index).split("_");
  if (words.length === 3) {
    return `${table.slice(0, index - 1)} (${words[0].toUpperCase()} SF ${
      words[1]
    }.${words[2]})`;
  }
  return `${table.slice(0, index - 1)} (${words[0].toUpperCase()} SF ${
    words[1]
  })`;
}
