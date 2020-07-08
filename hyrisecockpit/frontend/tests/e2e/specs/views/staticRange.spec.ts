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

      cy.visit(routes.overview);
      cy.wait("@" + getGetAlias(overviewRequest));
      cy.get(selectors.selectionListButton).click();
      cy.get("div[role=tab]").eq(1).click();
      cy.get(selectors.changeRangeTypeButton).click();
      cy.wait(300); // wait until page window changed

      cy.contains("The selected dates or times are invalid.");

      // set start date
      cy.get(selectors.datePickerText).eq(0).click();
      cy.get(selectors.datePickerSelect)
        .eq(0)
        .within(() => {
          cy.get("button").contains(startDate.getDate()).click();
        });

      // set start time
      cy.get(selectors.timePickerText).eq(0).type(startTime);

      // set end time
      cy.get(selectors.timePickerText).eq(1).clear().type(startTime);

      cy.contains(
        "The selected range is too small for the selected precision."
      );

      cy.get(selectors.setStaticRangeButton).should("be.disabled");
    });

    it("will not request future time range and precision", () => {
      cy.visit(routes.overview);
      cy.wait("@" + getGetAlias(overviewRequest));
      cy.get(selectors.selectionListButton).click();
      cy.get("div[role=tab]").eq(1).click();
      cy.get(selectors.changeRangeTypeButton).click();
      cy.wait(300); // wait until page window changed

      // set start date
      cy.get(selectors.datePickerText).eq(0).click();
      cy.get(selectors.datePickerSelect)
        .eq(0)
        .within(() => {
          cy.get("button").contains(baseDate.day).click();
        });

      // set start time
      cy.get(selectors.timePickerText)
        .eq(0)
        .type(
          formatTimeString(
            new Date(new Date(baseDate.dateTime).setHours(baseDate.hour + 1))
          )
        );

      // set end time
      cy.get(selectors.timePickerText).eq(1).clear().type("23:59");

      cy.contains("The selected dates and times are in the future.");

      cy.get(selectors.setStaticRangeButton).should("be.disabled");
    });

    it("will request the selected valid time range and precision", () => {
      const startTime = formatTimeString(startDate);
      const endTime = formatTimeString(endDate);
      const precisionIdx = generateRandomInt(0, basicPrecision.length);

      cy.visit(routes.overview);
      cy.wait("@" + getGetAlias(overviewRequest));
      cy.get(selectors.selectionListButton).click();
      cy.get("div[role=tab]").eq(1).click();
      cy.get(selectors.changeRangeTypeButton).click();
      cy.wait(300); // wait until page window changed

      // set start date
      cy.get(selectors.datePickerText).eq(0).click();
      cy.get(selectors.datePickerSelect)
        .eq(0)
        .within(() => {
          cy.get("button").contains(startDate.getDate()).click();
        });

      // set end date
      cy.get(selectors.datePickerText).eq(1).click();
      cy.get(selectors.datePickerSelect)
        .eq(1)
        .within(() => {
          cy.get("button").contains(endDate.getDate()).click();
        });

      // set start time
      cy.get(selectors.timePickerText).eq(0).type(startTime);

      // set end time
      cy.get(selectors.timePickerText).eq(1).clear().type(endTime);

      // set precision
      cy.get(selectors.selectionList).within(() => {
        cy.get(selectors.precisionSelection).eq(1).click({
          force: true,
        });
      });
      cy.get("div[role=option]").eq(precisionIdx).click({
        force: true,
      });
      backend.rename(overviewRequest, alias); // set new alias to get specific request
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
