import { useBackendMock } from "../../setup/backendMock";
import {
  getGetAlias,
  generateRandomInt,
  overviewRequests,
  comparisonRequests,
} from "../../setup/helpers";
import {
  getRoute,
  getDate,
  assertDataRequest,
  assertPrecisionRequest,
} from "./helpers";
import { clickElement } from "../helpers";
import {
  getSelector as getSelectionSelector,
  basicPrecision,
  assertStaticRangeRequest,
} from "./helpers";

const backend = useBackendMock();

const alias = "alias";

const comparisonRequest =
  comparisonRequests[generateRandomInt(0, comparisonRequests.length)];
const overviewRequest =
  overviewRequests[generateRandomInt(0, overviewRequests.length)];

const currentDate = new Date();
const startDay = generateRandomInt(currentDate.getDate() - 6, 5);
const endDay =
  startDay === currentDate.getDate()
    ? startDay
    : generateRandomInt(startDay, currentDate.getDate() - startDay - 1);
const startHour = generateRandomInt(0, 23);
const endHour =
  startHour === 23
    ? startHour
    : generateRandomInt(startHour + 1, 23 - startHour);

console.log(startDay, endDay, startHour, endHour);

// test static historical ranges
describe("requesting static historic time range", () => {
  beforeEach(() => {
    cy.setupAppState(backend);
    cy.wait("@" + getGetAlias("system"));
    cy.wait("@" + getGetAlias("storage"));
  });

  // test on overview
  describe("visiting overview page", () => {
    it("will not request invalid time range and precision", () => {
      const startTime = `${startHour < 10 ? "0" + startHour : startHour}:00`;

      cy.visit(getRoute("overview"));
      cy.wait("@" + getGetAlias(overviewRequest));
      clickElement(getSelectionSelector("selectionListButton"));
      cy.get("div[role=tab]").eq(1).click();
      cy.get(getSelectionSelector("changeRangeTypeButton")).click();
      cy.wait(300); // wait until page window changed

      // set start date
      cy.get(getSelectionSelector("datePickerText")).eq(0).click();
      cy.get(getSelectionSelector("datePickerSelect"))
        .eq(0)
        .within(() => {
          cy.get("button").contains(startDay).click();
        });

      // set start time
      cy.get(getSelectionSelector("timePickerText")).eq(0).type(startTime);

      // set end time
      cy.get(getSelectionSelector("timePickerText"))
        .eq(1)
        .clear()
        .type(startTime);

      cy.get(getSelectionSelector("setStaticRangeButton")).should(
        "be.disabled"
      );
    });

    it("will request the selected valid time range and precision", () => {
      const startTime = `${startHour < 10 ? "0" + startHour : startHour}:00`;
      const endTime = `${endHour < 10 ? "0" + endHour : endHour}:01`;
      const precisionIdx = generateRandomInt(0, basicPrecision.length);

      cy.visit(getRoute("overview"));
      cy.wait("@" + getGetAlias(overviewRequest));
      clickElement(getSelectionSelector("selectionListButton"));
      cy.get("div[role=tab]").eq(1).click();
      cy.get(getSelectionSelector("changeRangeTypeButton")).click();
      cy.wait(300); // wait until page window changed

      // set start date
      cy.get(getSelectionSelector("datePickerText")).eq(0).click();
      cy.get(getSelectionSelector("datePickerSelect"))
        .eq(0)
        .within(() => {
          cy.get("button").contains(startDay).click();
        });

      // set end date
      if (startDay !== endDay) {
        cy.get(getSelectionSelector("datePickerText")).eq(1).click();
        cy.get(getSelectionSelector("datePickerSelect"))
          .eq(1)
          .within(() => {
            cy.get("button").contains(endDay).click();
          });
      }

      // set start time
      cy.get(getSelectionSelector("timePickerText")).eq(0).type(startTime);

      // set end time
      cy.get(getSelectionSelector("timePickerText"))
        .eq(1)
        .clear()
        .type(endTime);

      // set precision
      cy.get(getSelectionSelector("selectionList")).within(() => {
        cy.get(getSelectionSelector("precisionSelection")).eq(1).click({
          force: true,
        });
      });
      cy.get("div[role=option]").eq(precisionIdx).click({
        force: true,
      });
      backend.rename(overviewRequest, alias); // set new alias to get specific request
      cy.get(getSelectionSelector("setStaticRangeButton")).click();

      cy.wait("@" + alias).then((xhr: any) => {
        const startDate = getDate(currentDate, startDay, startHour);
        const endDate = getDate(currentDate, endDay, endHour, 1);
        assertStaticRangeRequest(
          xhr.url,
          startDate,
          endDate,
          basicPrecision[precisionIdx]
        );
      });
      backend.restart(); // reset aliases
    });

    it("will restart with continuous range on click", () => {
      const startTime = `${startHour < 10 ? "0" + startHour : startHour}:00`;
      const endTime = `${startHour < 10 ? "0" + startHour : startHour}:01`;

      cy.visit(getRoute("overview"));
      cy.wait("@" + getGetAlias(overviewRequest));
      clickElement(getSelectionSelector("selectionListButton"));
      cy.get("div[role=tab]").eq(1).click();

      cy.get(getSelectionSelector("resetTimeRangeButton")).should(
        "be.disabled"
      );

      cy.get(getSelectionSelector("changeRangeTypeButton")).click();
      cy.wait(300); // wait until page window changed

      // set start date
      cy.get(getSelectionSelector("datePickerText")).eq(0).click();
      cy.get(getSelectionSelector("datePickerSelect"))
        .eq(0)
        .within(() => {
          cy.get("button").contains(startDay).click();
        });

      // set start time
      cy.get(getSelectionSelector("timePickerText")).eq(0).type(startTime);

      // set end time
      cy.get(getSelectionSelector("timePickerText"))
        .eq(1)
        .clear()
        .type(endTime);

      // set precision
      cy.get(getSelectionSelector("selectionList")).within(() => {
        cy.get(getSelectionSelector("precisionSelection")).eq(1).click({
          force: true,
        });
      });
      cy.get("div[role=option]").eq(0).click({
        force: true,
      });

      cy.get(getSelectionSelector("setStaticRangeButton")).click();
      cy.wait("@" + getGetAlias(overviewRequest));

      cy.get(getSelectionSelector("changeRangeTypeButton")).click();
      cy.wait(300); // wait until page window changed

      backend.rename(overviewRequest, alias); // set new alias to get specific request
      cy.get(getSelectionSelector("resetTimeRangeButton")).click();

      cy.wait("@" + alias).then((xhr: any) => {
        assertDataRequest(xhr.url, 30);
        assertPrecisionRequest(xhr.url, 1);
      });

      backend.restart(); // reset aliases
    });
  });
});
