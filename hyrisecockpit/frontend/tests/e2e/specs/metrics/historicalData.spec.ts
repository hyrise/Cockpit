import { useBackendMock } from "../../setup/backendMock";
import { getGetAlias } from "../../setup/helpers";
import { getSelector as getViewSelector, getRoute } from "../views/helpers";
import { testRedirection } from "../abstractTests";
import { assertDataRequest } from "./helpers";

const backend = useBackendMock();

// test cpu and ram
describe("requesting cpu and ram data", () => {
  beforeEach(() => {
    cy.setupAppState(backend);
    cy.wait("@" + getGetAlias("system"));
    cy.wait(1500);
  });

  // test on comparison
  describe("visiting comparison page", () => {
    it("will request the corect time range", () => {
      testRedirection(
        getViewSelector("comparisonButton"),
        getRoute("comparison")
      );
      // test historic data
      cy.wait("@" + getGetAlias("system"));
      cy.get("@" + getGetAlias("system")).then((xhr: any) => {
        assertDataRequest(xhr.url, 30);
      });
      cy.wait("@" + getGetAlias("system"));
      cy.get("@" + getGetAlias("system")).then((xhr: any) => {
        assertDataRequest(xhr.url, 30);
      });
      cy.wait(1500);
      // test current data
      cy.wait("@" + getGetAlias("system"));
      cy.get("@" + getGetAlias("system")).then((xhr: any) => {
        assertDataRequest(xhr.url, 1);
      });
      cy.wait("@" + getGetAlias("system"));
      cy.get("@" + getGetAlias("system")).then((xhr: any) => {
        assertDataRequest(xhr.url, 1);
      });
    });
  });

  // test on overview
  describe("visiting overview page", () => {
    it("will request the corect time range", () => {
      testRedirection(getViewSelector("overviewButton"), getRoute("overview"));
      // test historic data
      cy.wait("@" + getGetAlias("system"));
      cy.get("@" + getGetAlias("system")).then((xhr: any) => {
        assertDataRequest(xhr.url, 30);
      });
      cy.wait("@" + getGetAlias("system"));
      cy.get("@" + getGetAlias("system")).then((xhr: any) => {
        assertDataRequest(xhr.url, 30);
      });
      cy.wait(1500);
      // test current data
      cy.wait("@" + getGetAlias("system"));
      cy.get("@" + getGetAlias("system")).then((xhr: any) => {
        assertDataRequest(xhr.url, 1);
      });
      cy.wait("@" + getGetAlias("system"));
      cy.get("@" + getGetAlias("system")).then((xhr: any) => {
        assertDataRequest(xhr.url, 1);
      });
    });
  });
});

// test throughput
describe("requesting throughput data", () => {
  beforeEach(() => {
    cy.setupAppState(backend);
  });

  // test on comparison
  describe("visiting comparison page", () => {
    it("will request the corect time range", () => {
      testRedirection(
        getViewSelector("comparisonButton"),
        getRoute("comparison")
      );
      // test historic data
      cy.wait("@" + getGetAlias("throughput"));
      cy.get("@" + getGetAlias("throughput")).then((xhr: any) => {
        assertDataRequest(xhr.url, 30);
      });
      cy.wait(1500);
      // test current data
      cy.wait("@" + getGetAlias("throughput"));
      cy.get("@" + getGetAlias("throughput")).then((xhr: any) => {
        assertDataRequest(xhr.url, 1);
      });
    });
  });

  // test on overview
  describe("visiting overview page", () => {
    it("will request the corect time range", () => {
      testRedirection(getViewSelector("overviewButton"), getRoute("overview"));
      // test historic data
      cy.wait("@" + getGetAlias("throughput"));
      cy.get("@" + getGetAlias("throughput")).then((xhr: any) => {
        assertDataRequest(xhr.url, 30);
      });
      cy.wait(1500);
      // test current data
      cy.wait("@" + getGetAlias("throughput"));
      cy.get("@" + getGetAlias("throughput")).then((xhr: any) => {
        assertDataRequest(xhr.url, 1);
      });
    });
  });
});

// test latency
describe("requesting latency data", () => {
  beforeEach(() => {
    cy.setupAppState(backend);
  });

  // test on comparison
  describe("visiting comparison page", () => {
    it("will request the corect time range", () => {
      testRedirection(
        getViewSelector("comparisonButton"),
        getRoute("comparison")
      );
      // test historic data
      cy.wait("@" + getGetAlias("latency"));
      cy.get("@" + getGetAlias("latency")).then((xhr: any) => {
        assertDataRequest(xhr.url, 30);
      });
      cy.wait(1500);
      // test current data
      cy.wait("@" + getGetAlias("latency"));
      cy.get("@" + getGetAlias("latency")).then((xhr: any) => {
        assertDataRequest(xhr.url, 1);
      });
    });
  });

  // test on overview
  describe("visiting overview page", () => {
    it("will request the corect time range", () => {
      testRedirection(getViewSelector("overviewButton"), getRoute("overview"));
      // test historic data
      cy.wait("@" + getGetAlias("latency"));
      cy.get("@" + getGetAlias("latency")).then((xhr: any) => {
        assertDataRequest(xhr.url, 30);
      });
      cy.wait(1500);
      // test current data
      cy.wait("@" + getGetAlias("latency"));
      cy.get("@" + getGetAlias("latency")).then((xhr: any) => {
        assertDataRequest(xhr.url, 1);
      });
    });
  });
});

// test queue length
describe("requesting queue length data", () => {
  beforeEach(() => {
    cy.setupAppState(backend);
  });

  // test on comparison
  describe("visiting comparison page", () => {
    it("will request the corect time range", () => {
      testRedirection(
        getViewSelector("comparisonButton"),
        getRoute("comparison")
      );
      // test historic data
      cy.wait("@" + getGetAlias("queue_length"));
      cy.get("@" + getGetAlias("queue_length")).then((xhr: any) => {
        assertDataRequest(xhr.url, 30);
      });
      cy.wait(1500);
      // test current data
      cy.wait("@" + getGetAlias("queue_length"));
      cy.get("@" + getGetAlias("queue_length")).then((xhr: any) => {
        assertDataRequest(xhr.url, 1);
      });
    });
  });

  // test on overview
  describe("visiting overview page", () => {
    it("will request the corect time range", () => {
      testRedirection(getViewSelector("overviewButton"), getRoute("overview"));
      // test historic data
      cy.wait("@" + getGetAlias("queue_length"));
      cy.get("@" + getGetAlias("queue_length")).then((xhr: any) => {
        assertDataRequest(xhr.url, 30);
      });
      cy.wait(1500);
      // test current data
      cy.wait("@" + getGetAlias("queue_length"));
      cy.get("@" + getGetAlias("queue_length")).then((xhr: any) => {
        assertDataRequest(xhr.url, 1);
      });
    });
  });
});
