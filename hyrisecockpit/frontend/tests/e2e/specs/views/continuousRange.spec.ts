import { useBackendMock } from "../../setup/backendMock";
import {
  getGetAlias,
  generateRandomInt,
  overviewRequests,
  comparisonRequests,
  workloadMonitoringRequests,
} from "../../setup/helpers";
import { getRoute } from "./helpers";
import { clickElement } from "../helpers";
import {
  getSelector as getSelectionSelector,
  assertDataRequest,
  historicRanges,
  basicPrecision,
  assertPrecisionRequest,
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

      cy.visit(getRoute("comparison"));
      cy.wait("@" + getGetAlias(comparisonRequest));
      clickElement(getSelectionSelector("selectionListButton"));
      cy.get("div[role=tab]").eq(1).click();

      cy.get(getSelectionSelector("selectionList")).within(() => {
        cy.get(getSelectionSelector("historicRangeSelection")).click({
          force: true,
        });
      });
      backend.rename(comparisonRequest, rangeAlias); // set new alias to get specific request
      cy.get("div").contains(range.title).click({
        force: true,
      });
      cy.wait("@" + rangeAlias).then((xhr: any) => {
        assertDataRequest(xhr.url, range.value);
      });
      backend.restart(); // reset aliases
    });

    it("will request the selected precision", () => {
      const precisionIdx = generateRandomInt(0, basicPrecision.length);

      cy.visit(getRoute("comparison"));
      cy.wait("@" + getGetAlias(comparisonRequest));
      clickElement(getSelectionSelector("selectionListButton"));
      cy.get("div[role=tab]").eq(1).click();

      cy.get(getSelectionSelector("selectionList")).within(() => {
        cy.get(getSelectionSelector("precisionSelection")).click({
          force: true,
        });
      });
      backend.rename(comparisonRequest, precisionAlias); // set new alias to get specific request
      cy.get("div[role=option]").eq(precisionIdx).click({
        force: true,
      });
      cy.wait("@" + precisionAlias).then((xhr: any) => {
        assertPrecisionRequest(xhr.url, basicPrecision[precisionIdx]);
      });
      backend.restart(); // reset aliases
    });
  });

  // test on overview
  describe("visiting overview page", () => {
    it("will request the selected time range", () => {
      const range = ranges[generateRandomInt(0, ranges.length)][1];

      cy.visit(getRoute("overview"));
      cy.wait("@" + getGetAlias(overviewRequest));
      clickElement(getSelectionSelector("selectionListButton"));
      cy.get("div[role=tab]").eq(1).click();

      cy.get(getSelectionSelector("selectionList")).within(() => {
        cy.get(getSelectionSelector("historicRangeSelection")).click({
          force: true,
        });
      });
      backend.rename(overviewRequest, rangeAlias); // set new alias to get specific request
      cy.get("div").contains(range.title).click({
        force: true,
      });
      cy.wait("@" + rangeAlias).then((xhr: any) => {
        assertDataRequest(xhr.url, range.value);
      });
      backend.restart(); // reset aliases
    });

    it("will request the selected  precision", () => {
      const precisionIdx = generateRandomInt(0, basicPrecision.length);

      cy.visit(getRoute("overview"));
      cy.wait("@" + getGetAlias(overviewRequest));
      clickElement(getSelectionSelector("selectionListButton"));
      cy.get("div[role=tab]").eq(1).click();

      cy.get(getSelectionSelector("selectionList")).within(() => {
        cy.get(getSelectionSelector("precisionSelection")).click({
          force: true,
        });
      });
      backend.rename(overviewRequest, precisionAlias); // set new alias to get specific request
      cy.get("div[role=option]").eq(precisionIdx).click({
        force: true,
      });
      cy.wait("@" + precisionAlias).then((xhr: any) => {
        assertPrecisionRequest(xhr.url, basicPrecision[precisionIdx]);
      });
      backend.restart(); // reset aliases
    });
  });

  // test on workload monitoring
  describe("visiting workload monitoring page", () => {
    it("will request the selected time range", () => {
      const range = ranges[generateRandomInt(0, ranges.length)][1];

      cy.visit(getRoute("workloadMonitoring"));
      cy.wait("@" + getGetAlias(workloadRequest));
      clickElement(getSelectionSelector("selectionListButton"));
      cy.get("div[role=tab]").eq(1).click();

      cy.get(getSelectionSelector("selectionList")).within(() => {
        cy.get(getSelectionSelector("historicRangeSelection")).click({
          force: true,
        });
      });
      backend.rename(workloadRequest, rangeAlias); // set new alias to get specific request
      cy.get("div").contains(range.title).click({
        force: true,
      });
      cy.wait("@" + rangeAlias).then((xhr: any) => {
        assertDataRequest(xhr.url, range.value);
      });
      backend.restart(); // reset aliases
    });

    it("will request the selected  precision", () => {
      const precisionIdx = generateRandomInt(0, basicPrecision.length);

      cy.visit(getRoute("workloadMonitoring"));
      cy.wait("@" + getGetAlias(workloadRequest));
      clickElement(getSelectionSelector("selectionListButton"));
      cy.get("div[role=tab]").eq(1).click();

      cy.get(getSelectionSelector("selectionList")).within(() => {
        cy.get(getSelectionSelector("precisionSelection")).click({
          force: true,
        });
      });
      backend.rename(workloadRequest, precisionAlias); // set new alias to get specific request
      cy.get("div[role=option]").eq(precisionIdx).click({
        force: true,
      });
      cy.wait("@" + precisionAlias).then((xhr: any) => {
        assertPrecisionRequest(xhr.url, basicPrecision[precisionIdx]);
      });
      backend.restart(); // reset aliases
    });
  });
});
