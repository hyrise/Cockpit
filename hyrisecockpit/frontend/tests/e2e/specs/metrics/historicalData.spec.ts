import { useBackendMock } from "../../setup/backendMock";
import {
  getGetAlias,
  generateRandomInt,
  overviewRequests,
  comparisonRequests,
  workloadMonitoringRequests,
} from "../../setup/helpers";
import { getRoute } from "../views/helpers";
import { assertRangeRequest, historicRanges } from "./helpers";
import { clickElement } from "../helpers";
import { getSelector as getSelectionSelector } from "../views/helpers";

const backend = useBackendMock();
const ranges = Object.entries(historicRanges);

// test historical ranges
describe("requesting different time ranges", () => {
  beforeEach(() => {
    cy.setupAppState(backend);
    cy.wait("@" + getGetAlias("system"));
    cy.wait("@" + getGetAlias("storage"));
  });

  // test on comparison
  describe("visiting comparison page", () => {
    it("will request the selected time range", () => {
      const range = ranges[generateRandomInt(0, ranges.length)][1];
      const request =
        comparisonRequests[generateRandomInt(0, comparisonRequests.length)];

      cy.visit(getRoute("comparison"));

      clickElement(getSelectionSelector("selectionListButton"));
      cy.get(getSelectionSelector("selectionList")).within(() => {
        cy.get(getSelectionSelector("historicRangeSelection")).click({
          force: true,
        });
        cy.wait(500);
      });
      cy.get("div").contains(range.title).click({
        force: true,
      });

      assertRangeRequest("@" + getGetAlias(request), range.value);
    });
  });

  // test on overview
  describe("visiting overview page", () => {
    it("will request the selected time range", () => {
      const range = ranges[generateRandomInt(0, ranges.length)][1];
      const request =
        overviewRequests[generateRandomInt(0, overviewRequests.length)];

      cy.visit(getRoute("overview"));

      clickElement(getSelectionSelector("selectionListButton"));
      cy.get(getSelectionSelector("selectionList")).within(() => {
        cy.get(getSelectionSelector("historicRangeSelection")).click({
          force: true,
        });
        cy.wait(500);
      });
      cy.get("div").contains(range.title).click({
        force: true,
      });

      assertRangeRequest("@" + getGetAlias(request), range.value);
    });
  });

  // test on workload monitoring
  describe("visiting workload monitoring page", () => {
    it("will request the selected time range", () => {
      const range = ranges[generateRandomInt(0, ranges.length)][1];
      const request =
        workloadMonitoringRequests[
          generateRandomInt(0, workloadMonitoringRequests.length)
        ];

      cy.visit(getRoute("workloadMonitoring"));

      clickElement(getSelectionSelector("selectionListButton"));
      cy.get(getSelectionSelector("selectionList")).within(() => {
        cy.get(getSelectionSelector("historicRangeSelection")).click({
          force: true,
        });
        cy.wait(500);
      });
      cy.get("div").contains(range.title).click({
        force: true,
      });

      assertRangeRequest("@" + getGetAlias(request), range.value);
    });
  });
});
