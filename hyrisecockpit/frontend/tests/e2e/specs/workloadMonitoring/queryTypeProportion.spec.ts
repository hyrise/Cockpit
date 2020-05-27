import { useBackendMock } from "../../setup/backendMock";
import { getRoute } from "../views/helpers";
import {
  assertBarChartData,
  getDetailsSelectorWithID,
  getSelectorWithID,
} from "../metrics/helpers";
import { waitForChartRender } from "../helpers";

const backend = useBackendMock();

let databases: any = {};
let data: any = {};

// test on workload monitoring
describe("visiting the workload monitoring page", () => {
  before(() => {
    cy.setupAppState(backend).then((xhr: any) => {
      databases = xhr.response.body;
    });
    cy.visit(getRoute("workloadMonitoring"));
    cy.setupData("krueger_data").then((xhr: any) => {
      data = {};
      xhr.response.body.forEach((database: any) => {
        const entry: any = {};

        const totalLat = database.krueger_data.reduce(
          (sum: number, type: any) => sum + type.total_latency,
          0
        );
        const totalFreq = database.krueger_data.reduce(
          (sum: number, type: any) => sum + type.total_frequency,
          0
        );
        entry[database.id] = database.krueger_data.map((type: any) => {
          return {
            ...type,
            relativeLat: (type.total_latency / totalLat) * 100,
            relativeFreq: (type.total_frequency / totalFreq) * 100,
          };
        });

        data = { ...data, ...entry };
      });
    });
    waitForChartRender();
  });

  // test data
  it("will show the correct metric data", () => {
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
            ["Latency", "Frequency"],
            2
          );
        }
      );
    });
  });

  // test layout
  it("will show the correct range and title", () => {
    databases.forEach((database: any) => {
      cy.get(getSelectorWithID("queryTypeProportion", database.id)).should(
        (elements: any) => {
          const layout = elements[0].layout;
          expect(layout.xaxis.title.text).to.eq("Query Type");
          expect(layout.yaxis.title.text).to.eq(
            "Proportion of query types in %"
          );
          expect(layout.yaxis.range[0]).to.eq(0);
          expect(layout.yaxis.range[1]).to.eq(100);
        }
      );
    });
  });

  // test details
  it("will not show metric details", () => {
    databases.forEach((database: any) => {
      cy.get(
        getDetailsSelectorWithID("queryTypeProportion", database.id)
      ).should("not.exist");
    });
  });
});
