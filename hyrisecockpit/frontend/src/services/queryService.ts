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

  return { getDetailedQueryInformation };
}
