import { testRedirection } from "./abstractTestCases";

describe("Change page routes", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  describe("when clicking the overview button", () => {
    it("will redirect to the overview page", () => {
      testRedirection("div", "Overview", "overview");
    });
  });
});
