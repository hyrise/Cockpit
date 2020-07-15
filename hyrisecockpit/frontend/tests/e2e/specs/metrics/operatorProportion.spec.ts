import { assertBarChartData, getSelectorWithID } from "./helpers";
import {
  testNoVisibilityOnOverview,
  testGenericChartsOnPage,
} from "./abstractTests";

const metric = "operatorProportion";
const request = "workload_operator_information";
const layout = {
  xtitle: "Operator",
  ytitle: "Distribution of operator runtimes in %",
  ymin: 0,
  ymax: 100,
};
const transform = (xhr: any): any => {
  let data: any = {};
  xhr.response.body.forEach((database: any) => {
    const entry: any = {};
    const total = database.workload_operator_information.reduce(
      (sum: number, operator: any) => sum + operator.total_time_ns,
      0
    );
    entry[database.id] = database.workload_operator_information.map(
      (operator: any) => {
        return {
          ...operator,
          relativeTime: (operator.total_time_ns / total) * 100,
        };
      }
    );
    data = { ...data, ...entry };
  });
  return data;
};

/** Test correct data */
const testData = (data: any, databases: any): void => {
  databases.forEach((database: any) => {
    cy.get(getSelectorWithID("operatorProportion", database.id)).should(
      (elements: any) => {
        /** Transformed operator data with parts and combined values */
        const transformedData = data[database.id].reduce(
          (obj: any, opData: any) => {
            if (opData.relativeTime < 5) {
              obj.combined.Other = [
                obj.combined.Other[0] + opData.relativeTime,
              ];
            } else {
              obj.parts[opData.operator] = [opData.relativeTime];
            }
            return obj;
          },
          { parts: {}, combined: { Other: [0] } }
        );

        // assert distinct parts
        assertBarChartData(
          elements[0].data,
          transformedData.parts,
          undefined,
          2
        );

        // assert combined parts
        assertBarChartData(
          elements[0].data,
          transformedData.combined,
          undefined,
          2
        );
      }
    );
  });
};

/* test no existence on overview */
testNoVisibilityOnOverview(metric);

/* test generic and custom on comparison */
testGenericChartsOnPage({ metric, request }, layout, transform, (getData) => {
  // test data
  it("will show the correct metric data", () => {
    const { data, databases } = getData();
    testData(data, databases);
  });
});

/* test generic and custom on workload monitoring */
testGenericChartsOnPage(
  { metric, request, page: "workloadMonitoring" },
  layout,
  transform,
  (getData) => {
    // test data
    it("will show the correct metric data", () => {
      const { data, databases } = getData();
      testData(data, databases);
    });
  }
);
