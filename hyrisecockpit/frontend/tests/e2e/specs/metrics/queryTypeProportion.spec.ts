import { assertBarChartData, getSelectorWithID } from "./helpers";
import { testGenericChartsOnPage } from "./abstractTests";

const metric = "queryTypeProportion";
const request = "workload_statement_information";
const layout = {
  xtitle: "Statements",
  ytitle: "Proportion of statements in %",
  ymin: 0,
  ymax: 100,
};
const transform = (xhr: any): any => {
  let data: any = {};
  xhr.response.body.forEach((database: any) => {
    const entry: any = {};
    const totalLat = database.workload_statement_information.reduce(
      (sum: number, type: any) => sum + type.total_latency,
      0
    );
    const totalFreq = database.workload_statement_information.reduce(
      (sum: number, type: any) => sum + type.total_frequency,
      0
    );
    entry[database.id] = database.workload_statement_information.map(
      (type: any) => {
        return {
          ...type,
          relativeLat: (type.total_latency / totalLat) * 100,
          relativeFreq: (type.total_frequency / totalFreq) * 100,
        };
      }
    );

    data = { ...data, ...entry };
  });
  return data;
};

/* test generic and custom on workload monitoring */
testGenericChartsOnPage(
  { metric, request, page: "workloadMonitoring" },
  layout,
  transform,
  (getData) => {
    // test data
    it("will show the correct metric data", () => {
      const { data, databases } = getData();

      databases.forEach((database: any) => {
        cy.get(getSelectorWithID("queryTypeProportion", database.id)).should(
          (elements: any) => {
            const transformedData = data[database.id].reduce(
              (obj: any, database: any) => {
                obj[database.query_type] = [
                  database.relativeLat,
                  database.relativeFreq,
                ];
                return obj;
              },
              {}
            );

            assertBarChartData(
              elements[0].data,
              transformedData,
              ["Aggregated Runtime", "Frequency"],
              2
            );
          }
        );
      });
    });
  }
);
