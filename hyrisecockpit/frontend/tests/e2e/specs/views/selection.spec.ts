import { assertItemSelect, metrics, routes, selectors } from "./helpers";
import { useBackendMock } from "../../setup/backendMock";
import { selectors as databaseSelectors } from "../databases/helpers";
import { getSelectorWithID as getMetricSelector } from "../metrics/helpers";
import { generateRandomInt } from "../../setup/helpers";

const backend = useBackendMock({ databases: 2 });
let databases: any = [];

type PageConfig = {
  page: "overview" | "workloadMonitoring" | "comparison";
  title: string;
  multipleDatabases?: boolean;
};

const pageConfig: PageConfig[] = [
  {
    page: "workloadMonitoring",
    title: "Workload",
    multipleDatabases: true,
  },
  {
    page: "overview",
    title: "Overview",
  },
  {
    page: "comparison",
    title: "Comparison",
    multipleDatabases: true,
  },
];

/* test selection on every page by config */
pageConfig.forEach((page: any) => {
  testSelectionOnPage(page);
});

/** generic selection tests for a single page by config */
function testSelectionOnPage({
  page,
  title,
  multipleDatabases,
}: PageConfig): void {
  describe(`visiting the ${title} page`, () => {
    before(() => {
      cy.setupAppState(backend).then((xhr: any) => {
        databases = xhr.response.body;
      });
      cy.visit(routes[page]);
      cy.get(selectors.selectionListButton).click();
    });

    // test list header
    it("will show the correct selection list header", () => {
      cy.get(selectors.selectionList).within(() => {
        cy.contains(title).should("be.visible");
      });
    });

    // test unselect and select database
    it("will unselect and select the specific database", () => {
      const databaseIndex = generateRandomInt(0, databases.length);
      // unselect
      cy.get(databaseSelectors.databaseChip)
        .eq(databaseIndex)
        .within(() => {
          cy.get(selectors.unselectDatabase).click({ force: true });
          assertItemSelect("database", false);
        });
      cy.get(selectors.selectionListButton).click();
      cy.get((selectors as any)[`${page}Page`]).within(() => {
        cy.contains(databases[databaseIndex].id).should("not.be.visible");
      });

      // select
      cy.get(selectors.selectionListButton).click();
      cy.get(databaseSelectors.databaseChip)
        .eq(databaseIndex)
        .within(() => {
          cy.get(selectors.selectDatabase).click({ force: true });
          assertItemSelect("database", true);
        });
      cy.get(selectors.selectionListButton).click();
      cy.get((selectors as any)[`${page}Page`]).within(() => {
        cy.contains(databases[databaseIndex].id).should("be.visible");
      });
      cy.get(selectors.selectionListButton).click();
    });

    // test unselect and select metric
    it("will unselect and select the specific metric", () => {
      const pageMetrics = metrics[page];
      const metricIndex = generateRandomInt(0, pageMetrics.length);
      // unselect
      cy.get(selectors.metricChip)
        .eq(metricIndex)
        .within(() => {
          cy.get(selectors.unselectMetric).click({ force: true });
          assertItemSelect("metric", false);
        });
      cy.get(selectors.selectionListButton).click();
      cy.get((selectors as any)[`${page}Page`]).within(() => {
        if (multipleDatabases) {
          databases.forEach((database: any) => {
            cy.get(
              getMetricSelector(pageMetrics[metricIndex], database.id)
            ).should("not.be.visible");
          });
        } else {
          cy.get(getMetricSelector(pageMetrics[metricIndex])).should(
            "not.be.visible"
          );
        }
      });

      // select
      cy.get(selectors.selectionListButton).click();
      cy.get(selectors.metricChip)
        .eq(metricIndex)
        .within(() => {
          cy.get(selectors.selectMetric).click({ force: true });
          assertItemSelect("metric", true);
        });
      cy.get(selectors.selectionListButton).click();
      cy.get((selectors as any)[`${page}Page`]).within(() => {
        if (multipleDatabases) {
          databases.forEach((database: any) => {
            cy.get(
              getMetricSelector(pageMetrics[metricIndex], database.id)
            ).should("be.visible");
          });
        } else {
          cy.get(getMetricSelector(pageMetrics[metricIndex])).should(
            "be.visible"
          );
        }
      });
    });
  });
}
