import axios from "axios";
import { metricBackend } from "../../config";
import { DetailedQueryInformation } from "@/types/queries";
import { useFormatting } from "@/meta/formatting";
import { getDisplayedFromTransferred } from "@/meta/workloads";

export function useQueryService(): {
  getDetailedQueryInformation: () => Promise<
    Record<string, DetailedQueryInformation[]>
  >;
} {
  const { roundNumber } = useFormatting();

  async function getDetailedQueryInformation(): Promise<
    Record<string, DetailedQueryInformation[]>
  > {
    let detailedQueryInformation: Record<
      string,
      DetailedQueryInformation[]
    > = {};
    await axios
      .get(`${metricBackend}detailed_query_information`)
      .then((response: any) => {
        detailedQueryInformation = response.data.reduce(
          (
            queryInformation: Record<string, DetailedQueryInformation[]>,
            entry: any
          ) => {
            const database: string = entry.id;
            queryInformation[database] = entry.detailed_query_information.map(
              (query: any) => {
                return {
                  queryNumber: query.query_number,
                  workloadType: getDisplayedFromTransferred(query.benchmark),
                  latency: roundNumber(query.latency, Math.pow(10, 6)),
                  throughput: query.throughput,
                };
              }
            );
            return queryInformation;
          },
          {} as Record<string, DetailedQueryInformation[]>
        );
      });

    return detailedQueryInformation;
  }

  return { getDetailedQueryInformation };
}
