import { useBackendMock } from "../../setup/backendMock";
import {
  getGetAlias,
  generateRandomInt,
  overviewRequests,
  comparisonRequests,
  workloadMonitoringRequests,
  Request,
} from "../../setup/helpers";
import {
  assertPrecisionRequest,
  assertTimeIntervalRequest,
  basicPrecision,
  historicRanges,
  routes,
  selectors,
} from "./helpers";

const backend = useBackendMock();

const rangeAlias = "range";
const precisionAlias = "precision";
const ranges = Object.entries(historicRanges).filter(
  (element) => element[0] !== "0.5"
); // select new range
const comparisonRequest =
  comparisonRequests[generateRandomInt(0, comparisonRequests.length)];
const overviewRequest =
  overviewRequests[generateRandomInt(0, overviewRequests.length)];
const workloadRequest =
  workloadMonitoringRequests[
    generateRandomInt(0, workloadMonitoringRequests.length)
  ];

type PageConfig = {
  page: "overview" | "comparison" | "workloadMonitoring";
  request: Request;
};

const pageConfig: PageConfig[] = [
  { page: "overview", request: overviewRequest },
  { page: "comparison", request: comparisonRequest },
  { page: "workloadMonitoring", request: workloadRequest },
];

/* test continuous range on every page by config */
describe("requesting different time ranges", () => {
  beforeEach(() => {
    cy.setupAppState(backend);
    cy.wait("@" + getGetAlias("system"));
    cy.wait("@" + getGetAlias("storage"));
  });

  pageConfig.forEach((page) => {
    testContinuousRangeOnPage(page);
  });
});

/** generic continuous range tests for a single page by config */
function testContinuousRangeOnPage({
  page,
  request,
}: {
  page: "overview" | "comparison" | "workloadMonitoring";
  request: Request;
}): void {
  describe(`visiting ${page} page`, () => {
    it("will request the selected time range", () => {
      const range = ranges[generateRandomInt(0, ranges.length)][1];

      cy.visit(routes[page]);
      cy.wait("@" + getGetAlias(request));
      cy.get(selectors.selectionListButton).click();
      cy.get("div[role=tab]").eq(1).click();

      cy.get(selectors.selectionList).within(() => {
        cy.get(selectors.historicRangeSelection).click({
          force: true,
        });
      });
      backend.rename(request, rangeAlias); // set new alias to get specific request
      cy.get("div").contains(range.title).click({
        force: true,
      });
      cy.wait("@" + rangeAlias).then((xhr: any) => {
        assertTimeIntervalRequest(xhr.url, range.value);
      });
      backend.restart(); // reset aliases
    });

    it("will request the selected precision", () => {
      const precisionIdx = generateRandomInt(0, basicPrecision.length);

      cy.visit(routes[page]);
      cy.wait("@" + getGetAlias(request));
      cy.get(selectors.selectionListButton).click();
      cy.get("div[role=tab]").eq(1).click();

      cy.get(selectors.selectionList).within(() => {
        cy.get(selectors.precisionSelection).click({
          force: true,
        });
      });
      backend.rename(request, precisionAlias); // set new alias to get specific request
      cy.get("div[role=option]").eq(precisionIdx).click({
        force: true,
      });
      cy.wait("@" + precisionAlias).then((xhr: any) => {
        assertPrecisionRequest(xhr.url, basicPrecision[precisionIdx]);
      });
      backend.restart(); // reset aliases
    });
  });
}
