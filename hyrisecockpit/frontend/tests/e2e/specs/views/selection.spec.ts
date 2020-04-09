import { testRedirection } from "../abstractTests";
import {
  getRoute,
  getSelector,
  getMetrics,
  assertItemSelect,
  checkMultipleMetrics
} from "./helpers";
import { useBackendMock } from "../../setup/backendMock";
import { clickElement } from "../helpers";
import { getSelector as getDatabaseSelector } from "../databases/helpers";
import { getSelectorWithID as getMetricSelector } from "../metrics/helpers";
import { generateRandomInt } from "../../setup/helpers";

const backend = useBackendMock({ databases: 2 });
let databases: any = [];
let databaseIndex: number = 0;
let metricIndex: number = 0;

// test on workload monitoring
describe("visiting the workload monitoring page", () => {
  before(() => {
    cy.setupAppState(backend).then((xhr: any) => {
      databases = xhr.response.body;
    });
    testRedirection(
      getSelector("workloadMonitoringButton"),
      getRoute("workloadMonitoring")
    );
    clickElement(getSelector("selectionListButton"));
  });

  // test list header
  it("will show the correct selection list header", () => {
    cy.get(getSelector("selectionList")).within(() => {
      cy.contains("Workload").should("be.visible");
    });
  });

  // test correct number of databases
  it("will show the correct number of selectable databases", () => {
    cy.get(getSelector("selectionList")).within(() => {
      databases.forEach((database: any, idx: number) => {
        cy.get(getDatabaseSelector("databaseChip"))
          .eq(idx)
          .contains(database.id);
      });
    });
  });

  // test unselect and select database
  it("will unselect and select the specific database", () => {
    databaseIndex = generateRandomInt(0, databases.length);
    // unselect
    cy.get(getDatabaseSelector("databaseChip"))
      .eq(databaseIndex)
      .within(() => {
        cy.get(getSelector("unselectDatabase")).click({ force: true });
        assertItemSelect("database", false);
      });
    clickElement(getSelector("selectionListButton"));
    cy.get(getSelector("workloadMonitoringPage")).within(() => {
      cy.get("div")
        .filter(`:contains(${databases[databaseIndex].id})`)
        .should("not.be.visible");
    });

    // select
    clickElement(getSelector("selectionListButton"));
    cy.get(getDatabaseSelector("databaseChip"))
      .eq(databaseIndex)
      .within(() => {
        cy.get(getSelector("selectDatabase")).click({ force: true });
        assertItemSelect("database", true);
      });
    clickElement(getSelector("selectionListButton"));
    cy.get(getSelector("workloadMonitoringPage")).within(() => {
      cy.get("div")
        .filter(`:contains(${databases[databaseIndex].id})`)
        .should("be.visible");
    });

    clickElement(getSelector("selectionListButton"));
  });

  // test unselect and select metric
  it("will unselect and select the specific metric", () => {
    const metrics = getMetrics("workloadMonitoring");
    metricIndex = generateRandomInt(0, metrics.length);
    // unselect
    cy.get(getSelector("metricChip"))
      .eq(metricIndex)
      .within(() => {
        cy.get(getSelector("unselectMetric")).click({ force: true });
        assertItemSelect("metric", false);
      });
    clickElement(getSelector("selectionListButton"));
    cy.get(getSelector("workloadMonitoringPage")).within(() => {
      cy.get(getMetricSelector(metrics[metricIndex])).should("not.be.visible");
    });

    // select
    clickElement(getSelector("selectionListButton"));
    cy.get(getSelector("metricChip"))
      .eq(metricIndex)
      .within(() => {
        cy.get(getSelector("selectMetric")).click({ force: true });
        assertItemSelect("metric", true);
      });
    clickElement(getSelector("selectionListButton"));
    cy.get(getSelector("workloadMonitoringPage")).within(() => {
      cy.get(getMetricSelector(metrics[metricIndex])).should("be.visible");
    });
  });
});

// test on overview
describe("visiting the overview page", () => {
  before(() => {
    cy.setupAppState(backend).then((xhr: any) => {
      databases = xhr.response.body;
    });
    testRedirection(getSelector("overviewButton"), getRoute("overview"));
    clickElement(getSelector("selectionListButton"));
  });

  // test list header
  it("will show the correct selection list header", () => {
    cy.get(getSelector("selectionList")).within(() => {
      cy.contains("Overview").should("be.visible");
    });
  });

  // test correct number of databases
  it("will show the correct number of selectable databases", () => {
    cy.get(getSelector("selectionList")).within(() => {
      databases.forEach((database: any, idx: number) => {
        cy.get(getDatabaseSelector("databaseChip"))
          .eq(idx)
          .contains(database.id);
      });
    });
  });

  // test unselect and select database
  it("will unselect and select the specific database", () => {
    databaseIndex = generateRandomInt(0, databases.length);
    // unselect
    cy.get(getDatabaseSelector("databaseChip"))
      .eq(databaseIndex)
      .within(() => {
        cy.get(getSelector("unselectDatabase")).click({ force: true });
        assertItemSelect("database", false);
      });
    clickElement(getSelector("selectionListButton"));
    cy.get(getSelector("overviewPage")).within(() => {
      cy.get("div")
        .filter(`:contains(${databases[databaseIndex].id})`)
        .should("not.be.visible");
    });

    // select
    clickElement(getSelector("selectionListButton"));
    cy.get(getDatabaseSelector("databaseChip"))
      .eq(databaseIndex)
      .within(() => {
        cy.get(getSelector("selectDatabase")).click({ force: true });
        assertItemSelect("database", true);
      });
    clickElement(getSelector("selectionListButton"));
    cy.get(getSelector("overviewPage")).within(() => {
      cy.get("div")
        .filter(`:contains(${databases[databaseIndex].id})`)
        .should("be.visible");
    });

    clickElement(getSelector("selectionListButton"));
  });

  // test unselect and select metric
  it("will unselect and select the specific metric", () => {
    const metrics = getMetrics("overview");
    metricIndex = generateRandomInt(0, metrics.length);
    // unselect
    cy.get(getSelector("metricChip"))
      .eq(metricIndex)
      .within(() => {
        cy.get(getSelector("unselectMetric")).click({ force: true });
        assertItemSelect("metric", false);
      });
    clickElement(getSelector("selectionListButton"));
    cy.get(getSelector("overviewPage")).within(() => {
      cy.get(getMetricSelector(metrics[metricIndex])).should("not.be.visible");
    });

    // select
    clickElement(getSelector("selectionListButton"));
    cy.get(getSelector("metricChip"))
      .eq(metricIndex)
      .within(() => {
        cy.get(getSelector("selectMetric")).click({ force: true });
        assertItemSelect("metric", true);
      });
    clickElement(getSelector("selectionListButton"));
    cy.get(getSelector("overviewPage")).within(() => {
      cy.get(getMetricSelector(metrics[metricIndex])).should("be.visible");
    });
  });
});

// test on comparison
describe("visiting the comparison page", () => {
  before(() => {
    cy.setupAppState(backend).then((xhr: any) => {
      databases = xhr.response.body;
    });
    testRedirection(getSelector("comparisonButton"), getRoute("comparison"));
    clickElement(getSelector("selectionListButton"));
  });

  // test list header
  it("will show the correct selection list header", () => {
    cy.get(getSelector("selectionList")).within(() => {
      cy.contains("Comparison").should("be.visible");
    });
  });

  // test correct number of databases
  it("will show the correct number of selectable databases", () => {
    cy.get(getSelector("selectionList")).within(() => {
      databases.forEach((database: any, idx: number) => {
        cy.get(getDatabaseSelector("databaseChip"))
          .eq(idx)
          .contains(database.id);
      });
    });
  });

  // test unselect and select database
  it("will unselect and select the specific database", () => {
    databaseIndex = generateRandomInt(0, databases.length);
    // unselect
    cy.get(getDatabaseSelector("databaseChip"))
      .eq(databaseIndex)
      .within(() => {
        cy.get(getSelector("unselectDatabase")).click({ force: true });
        assertItemSelect("database", false);
      });
    clickElement(getSelector("selectionListButton"));
    cy.get(getSelector("comparisonPage")).within(() => {
      cy.get("div")
        .filter(`:contains(${databases[databaseIndex].id})`)
        .should("not.be.visible");
    });

    // select
    clickElement(getSelector("selectionListButton"));
    cy.get(getDatabaseSelector("databaseChip"))
      .eq(databaseIndex)
      .within(() => {
        cy.get(getSelector("selectDatabase")).click({ force: true });
        assertItemSelect("database", true);
      });
    clickElement(getSelector("selectionListButton"));
    cy.get(getSelector("comparisonPage")).within(() => {
      cy.get("div")
        .filter(`:contains(${databases[databaseIndex].id})`)
        .should("be.visible");
    });

    clickElement(getSelector("selectionListButton"));
  });

  // test unselect and select metric
  it("will unselect and select the specific metric", () => {
    const metrics = getMetrics("comparison");
    metricIndex = generateRandomInt(0, metrics.length);
    // unselect
    cy.get(getSelector("metricChip"))
      .eq(metricIndex)
      .within(() => {
        cy.get(getSelector("unselectMetric")).click({ force: true });
        assertItemSelect("metric", false);
      });
    clickElement(getSelector("selectionListButton"));
    cy.get(getSelector("comparisonPage")).within(() => {
      databases.forEach((database: any) => {
        cy.get(
          getMetricSelector(
            checkMultipleMetrics(metrics[metricIndex]),
            database.id
          )
        ).should("not.be.visible");
      });
    });

    // select
    clickElement(getSelector("selectionListButton"));
    cy.get(getSelector("metricChip"))
      .eq(metricIndex)
      .within(() => {
        cy.get(getSelector("selectMetric")).click({ force: true });
        assertItemSelect("metric", true);
      });
    clickElement(getSelector("selectionListButton"));
    cy.get(getSelector("comparisonPage")).within(() => {
      databases.forEach((database: any) => {
        cy.get(
          getMetricSelector(
            checkMultipleMetrics(metrics[metricIndex]),
            database.id
          )
        ).should("be.visible");
      });
    });
  });
});
