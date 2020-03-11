import axios from "axios";
import { monitorBackend } from "../../config";
import { DetailedQueryInformation } from "@/types/queries";

export function useQueryService(): {
  getDetailedQueryInformation: () => Promise<
    Record<string, DetailedQueryInformation[]>
  >;
} {
  async function getDetailedQueryInformation(): Promise<
    Record<string, DetailedQueryInformation[]>
  > {
    let detailedQueryInformation: Record<
      string,
      DetailedQueryInformation[]
    > = {};
    await axios
      .get(`${monitorBackend}detailed_latency/`)
      .then((response: any) => {
        detailedQueryInformation = response.reduce(
          (
            queryInformation: Record<string, DetailedQueryInformation[]>,
            entry: any
          ) => {
            const database: string = entry.id;
            //TODO: add correct property
            queryInformation[database] = [];
            entry.detailed.forEach((query: any) => {
              queryInformation[database].push({
                queryName: query.workload_type + "-" + query.query_number,
                workloadType: query.workload_type,
                latency: query.latency,
                throughput: query.throughput
              });
            });
          },
          {} as Record<string, DetailedQueryInformation[]>
        );
      });
    return detailedQueryInformation;
  }

  //   async function getQueryLatencyInformation(): Promise<
  //     QueryLatencyInformation[]
  //   > {
  //     let latencyInformation: QueryLatencyInformation[] = [];
  //     await axios
  //       .get(`${monitorBackend}detailed_latency/`)
  //       .then((response: any) => {
  //         latencyInformation = transformQueryLatencyInformation(response);
  //       });
  //     return latencyInformation;
  //   }

  //   async function getQueryThroughputInformation(): Promise<
  //     QueryThroughputInformation[]
  //   > {
  //     let throughputInformation: QueryThroughputInformation[] = [];
  //     await axios
  //       .get(`${monitorBackend}detailed_throughput/`)
  //       .then((response: any) => {
  //         throughputInformation = transformQueryThroughputInformation(response);
  //       });
  //     return throughputInformation;
  //   }

  //   function transformQueryLatencyInformation(
  //     response: any[]
  //   ): QueryLatencyInformation[] {
  //     return response.reduce(
  //       (latencyInformation: QueryLatencyInformation[], databaseEntries: any) => {
  //         const database = databaseEntries.id;
  //         (databaseEntries.detailed_latency as any[]).forEach((entry: any) => {
  //           latencyInformation.push({
  //             queryName: entry.workload_type + "-" + entry.query_number,
  //             workloadType: entry.workload_type,
  //             latency: entry.latency,
  //             databaseId: database
  //           } as QueryLatencyInformation);
  //         });
  //       },
  //       [] as QueryLatencyInformation[]
  //     );
  //   }

  //   function transformQueryThroughputInformation(
  //     response: any[]
  //   ): QueryThroughputInformation[] {
  //     return response.reduce(
  //       (
  //         throughputInformation: QueryThroughputInformation[],
  //         databaseEntries: any
  //       ) => {
  //         const database = databaseEntries.id;
  //         (databaseEntries.detailed_throughput as any[]).forEach((entry: any) => {
  //           throughputInformation.push({
  //             queryName: entry.workload_type + "-" + entry.query_number,
  //             workloadType: entry.workload_type,
  //             throughput: entry.throughput,
  //             databaseId: database
  //           } as QueryThroughputInformation);
  //         });
  //       },
  //       [] as QueryThroughputInformation[]
  //     );
  //   }

  return { getDetailedQueryInformation };
}
