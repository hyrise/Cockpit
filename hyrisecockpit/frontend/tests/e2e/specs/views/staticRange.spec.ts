import { useBackendMock } from "../../setup/backendMock";
import {
  getGetAlias,
  generateRandomInt,
  overviewRequests,
} from "../../setup/helpers";
import {
  getRoute,
  assertTimeIntervalRequest,
  assertPrecisionRequest,
} from "./helpers";
import { clickElement } from "../helpers";
import {
  getSelector as getSelectionSelector,
  basicPrecision,
  assertStaticRangeRequest,
  formatTimeString,
} from "./helpers";
import { fakeDate } from "../../setup/factories";

const backend = useBackendMock();

const alias = "alias";

const overviewRequest =
  overviewRequests[generateRandomInt(0, overviewRequests.length)];

const baseDate = fakeDate(7, 7, 22);
const endDate = baseDate.dateTime as Date;
const startDate = new Date(
  new Date(new Date(baseDate.dateTime).setDate(baseDate.day - 6)).setHours(
    baseDate.hour - 6
  )
);

// test static historical ranges
describe("requesting static historic time range", () => {
  beforeEach(() => {
    cy.clock(baseDate.dateTime.getTime(), ["Date"]); // overwrite date object
    cy.setupAppState(backend);
    cy.wait("@" + getGetAlias("system"));
    cy.wait("@" + getGetAlias("storage"));
  });

  // test on overview
  describe("visiting overview page", () => {
    it("will not request invalid time range and precision", () => {
      const startTime = formatTimeString(startDate);

      cy.visit(getRoute("overview"));
      cy.wait("@" + getGetAlias(overviewRequest));
      clickElement(getSelectionSelector("selectionListButton"));
      cy.get("div[role=tab]").eq(1).click();
      cy.get(getSelectionSelector("changeRangeTypeButton")).click();
      cy.wait(300); // wait until page window changed

      cy.contains("The selected dates or times are invalid.");

      // set start date
      cy.get(getSelectionSelector("datePickerText")).eq(0).click();
      cy.get(getSelectionSelector("datePickerSelect"))
        .eq(0)
        .within(() => {
          cy.get("button").contains(startDate.getDate()).click();
        });

      // set start time
      cy.get(getSelectionSelector("timePickerText")).eq(0).type(startTime);

      // set end time
      cy.get(getSelectionSelector("timePickerText"))
        .eq(1)
        .clear()
        .type(startTime);

      cy.contains(
        "The selected range is too small for the selected precision."
      );

      cy.get(getSelectionSelector("setStaticRangeButton")).should(
        "be.disabled"
      );
    });

    it("will not request future time range and precision", () => {
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
          cy.get("button").contains(baseDate.day).click();
        });

      // set start time
      cy.get(getSelectionSelector("timePickerText"))
        .eq(0)
        .type(
          formatTimeString(
            new Date(new Date(baseDate.dateTime).setHours(baseDate.hour + 1))
          )
        );

      // set end time
      cy.get(getSelectionSelector("timePickerText"))
        .eq(1)
        .clear()
        .type("23:59");

      cy.contains("The selected dates and times are in the future.");

      cy.get(getSelectionSelector("setStaticRangeButton")).should(
        "be.disabled"
      );
    });

    it("will request the selected valid time range and precision", () => {
      const startTime = formatTimeString(startDate);
      const endTime = formatTimeString(endDate);
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
          cy.get("button").contains(startDate.getDate()).click();
        });

      // set end date
      cy.get(getSelectionSelector("datePickerText")).eq(1).click();
      cy.get(getSelectionSelector("datePickerSelect"))
        .eq(1)
        .within(() => {
          cy.get("button").contains(endDate.getDate()).click();
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
      cy.get("div[role=option]").eq(precisionIdx).click({
        force: true,
      });
      backend.rename(overviewRequest, alias); // set new alias to get specific request
      cy.get(getSelectionSelector("setStaticRangeButton")).click();

      cy.wait("@" + alias).then((xhr: any) => {
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
      const startTime = formatTimeString(startDate);
      const endTime = formatTimeString(endDate);

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
          cy.get("button").contains(startDate.getDate()).click();
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
        assertTimeIntervalRequest(xhr.url, 30);
        assertPrecisionRequest(xhr.url, 1);
      });

      backend.restart(); // reset aliases
    });
  });
});
