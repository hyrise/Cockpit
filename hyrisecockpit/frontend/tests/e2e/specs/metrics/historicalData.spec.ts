import { useBackendMock } from "../../setup/backendMock";
import { getGetAlias } from "../../setup/helpers";
import { getRoute } from "../views/helpers";
import { assertDataRequest } from "./helpers";
import { waitForChartRender } from "../helpers";

const backend = useBackendMock();

// test cpu and ram
describe("requesting cpu and ram data", () => {
  beforeEach(() => {
    cy.setupAppState(backend);
    cy.wait("@" + getGetAlias("system"));
    cy.wait(1500);
    waitForChartRender();
  });

  // test on comparison
  describe("visiting comparison page", () => {
    it("will request the corect time range", () => {
      cy.visit(getRoute("comparison"));
      // test historic data
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
    });
  });

  // test on overview
  describe("visiting overview page", () => {
    it("will request the corect time range", () => {
      cy.visit(getRoute("overview"));
      // test historic data
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
    });
  });
});

// test memory footprint
describe("requesting memory footprint data", () => {
  beforeEach(() => {
    cy.setupAppState(backend);
    cy.wait("@" + getGetAlias("storage"));
    cy.wait(1500);
    waitForChartRender();
  });

  // test on comparison
  describe("visiting comparison page", () => {
    it("will request the corect time range", () => {
      cy.visit(getRoute("comparison"));
      // test historic data
      cy.wait("@" + getGetAlias("storage"));
      cy.get("@" + getGetAlias("storage")).then((xhr: any) => {
        assertDataRequest(xhr.url, 30);
      });
      cy.wait(1500);
      // test current data
      cy.wait("@" + getGetAlias("storage"));
      cy.get("@" + getGetAlias("storage")).then((xhr: any) => {
        assertDataRequest(xhr.url, 1);
      });
    });
  });

  // test on overview
  describe("visiting overview page", () => {
    it("will request the corect time range", () => {
      cy.visit(getRoute("overview"));
      // test historic data
      cy.wait("@" + getGetAlias("storage"));
      cy.get("@" + getGetAlias("storage")).then((xhr: any) => {
        assertDataRequest(xhr.url, 30);
      });
      cy.wait(1500);
      // test current data
      cy.wait("@" + getGetAlias("storage"));
      cy.get("@" + getGetAlias("storage")).then((xhr: any) => {
        assertDataRequest(xhr.url, 1);
      });
    });
  });
});

// test throughput
describe("requesting throughput data", () => {
  beforeEach(() => {
    cy.setupAppState(backend);
    waitForChartRender();
  });

  // test on comparison
  describe("visiting comparison page", () => {
    it("will request the corect time range", () => {
      cy.visit(getRoute("comparison"));
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
      cy.visit(getRoute("overview"));
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
    waitForChartRender();
  });

  // test on comparison
  describe("visiting comparison page", () => {
    it("will request the corect time range", () => {
      cy.visit(getRoute("comparison"));
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
      cy.visit(getRoute("overview"));
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
    waitForChartRender();
  });

  // test on comparison
  describe("visiting comparison page", () => {
    it("will request the corect time range", () => {
      cy.visit(getRoute("comparison"));
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
      cy.visit(getRoute("overview"));
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
