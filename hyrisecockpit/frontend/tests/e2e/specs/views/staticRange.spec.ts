import { useBackendMock } from "../../setup/backendMock";
import {
  getGetAlias,
  generateRandomInt,
  overviewRequests,
} from "../../setup/helpers";
import {
  basicPrecision,
  assertStaticRangeRequest,
  formatTimeString,
  routes,
  selectors,
} from "./helpers";

const backend = useBackendMock();

const alias = "alias";
const request = overviewRequests[generateRandomInt(0, overviewRequests.length)];

const baseDate = new Date(2017, 9, 19, 10);
const endDate = new Date(new Date(baseDate).setHours(8));
const startDate = new Date(new Date(baseDate).setDate(18));

// test static historical ranges
describe("requesting static historic time range", () => {
  beforeEach(() => {
    cy.clock(baseDate.getTime(), ["Date"]); // overwrite date object
    cy.setupAppState(backend);
    cy.wait("@" + getGetAlias("system"));
    cy.wait("@" + getGetAlias("storage"));
    cy.visit(routes.overview);
    cy.wait("@" + getGetAlias(request));
  });

  describe("opening the static time selection tab", () => {
    it("will not request future time range and precision", () => {
      fillDateAndTime({
        start: baseDate,
        startTime: formatTimeString(baseDate),
        endTime: "23:59",
      });

      cy.contains("The selected dates and times are in the future.");
      cy.get(selectors.setStaticRangeButton).should("be.disabled");
    });

    it("will request the selected valid time range and precision", () => {
      const precisionIdx = generateRandomInt(0, basicPrecision.length);

      fillDateAndTime({
        start: startDate,
        end: endDate,
        startTime: formatTimeString(startDate),
        endTime: formatTimeString(endDate),
        precisionIdx,
      });

      backend.rename(request, alias); // set new alias to get specific request
      cy.get(selectors.setStaticRangeButton).click();

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
  });
});

function fillDateAndTime({
  start,
  end,
  startTime,
  endTime,
  precisionIdx,
}: {
  start: Date;
  end?: Date;
  startTime: string;
  endTime: string;
  precisionIdx?: number;
}): void {
  // open static range selection tab
  cy.get(selectors.selectionListButton).click();
  cy.get("div[role=tab]").eq(1).click();
  cy.get(selectors.changeRangeTypeButton).click();
  cy.wait(300);

  // unfilled dates are invalid per default
  cy.contains("The selected dates or times are invalid.");

  // set start date
  cy.get(selectors.datePickerText).eq(0).click();
  cy.get(selectors.datePickerSelect)
    .eq(0)
    .within(() => {
      cy.get("button").contains(start.getDate()).click();
    });

  // set start time
  cy.get(selectors.timePickerText).eq(0).type(startTime);

  // set end date
  if (end) {
    cy.get(selectors.datePickerText).eq(1).click();
    cy.get(selectors.datePickerSelect)
      .eq(1)
      .within(() => {
        cy.get("button").contains(end.getDate()).click();
      });
  }

  // set end time
  cy.get(selectors.timePickerText).eq(1).clear().type(endTime);

  // set precision
  if (precisionIdx) {
    cy.get(selectors.selectionList).within(() => {
      cy.get(selectors.precisionSelection).eq(1).click({
        force: true,
      });
    });
    cy.get("div[role=option]").eq(precisionIdx).click({
      force: true,
    });
  }
}
