import { useBackendMock } from "../../setup/backendMock";
import { clickElement } from "../helpers";
import { getPostAlias } from "../../setup/helpers";

const backend = useBackendMock({
  databases: 1,
  tables: 2,
  columns: 2,
  chunks: 2,
  queries: 10,
  plugins: 3,
  activated_plugins: 0
});

describe("Add database", () => {
  beforeEach(() => {
    backend.start();
    cy.visit("/");
  });

  /* This test is currently just a blueprint for how to handle post requests */

  // test adding correct database
  describe("when adding a new database", () => {
    it("will add a new database with the correct data", () => {
      clickElement("div", "Database");
      cy.get("span[id=add-database-button]").click();
      cy.contains("Add new database1");
      cy.get("button[id=save-database-button]").click();
      cy.wait("@" + getPostAlias("database"));
      cy.get("@addDatabase").should(xhr => {
        // assert correct values here
        // accessibile via xhr.request.body
      });
      // spy if callback was called here
    });
  });
});
