import { isInTestMode } from "../../config";

function getDisplayWorkloadName(workloadType: string): string {
  const workload_type_map: Record<string, string> = {
    tpch: "TPC-H",
    tpcds: "TPC-DS",
    tpcc: "TPC-C",
    job: "Join Order Benchmark",
  };
  return workload_type_map[workloadType];
}

export function getWorkloadName(
  workloadType: string,
  scaleFactor: string
): string {
  return `${getDisplayWorkloadName(workloadType)} (SF ${scaleFactor})`;
}

// The following code is pretty ugly. The workload selector component is working somehow
// with the workload name. So every time a workload is selected from the workload name (displayed name)
// the name and scale factor needs to be retrieved. If for example the *name: job, scalefactor: 1* is transformed to
// *Join Order Benchmark (SF 1)* we need to extract job *name: job, scalefactor: 1*. For that we are using regex.

export function getWorkloadType(workloadName: string): string {
  const workload_type_map: Record<string, string> = {
    "TPC-H": "tpch",
    "TPC-DS": "tpcds",
    "TPC-C": "tpcc",
    "Join Order Benchmark": "job",
  };
  const workload: string = workloadName.split(" (")[0];
  return workload_type_map[workload];
}

export function getScaleFactor(workloadName: string): string {
  const regExp = /\(([^)]+)\)/;
  const matches = regExp.exec(workloadName);
  // @ts-ignore
  return matches[1].split(" ")[1];
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
