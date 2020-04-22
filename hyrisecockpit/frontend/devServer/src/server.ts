/* eslint-disable prettier/prettier */
import { Entity, Request } from "../../tests/e2e/setup/helpers";
import { useMocks } from "../../tests/e2e/setup/mocks";

import express from "express";

import bodyParser from "body-parser";

const server = express();
const mocks = useMocks(getInitialNumbers({}));

function getInitialNumbers(numbers: Partial<Record<Entity, number>>) {
  return {
    activated_plugins: 1,
    chunks: 2,
    columns: 2,
    databases: 2,
    loaded_benchmarks: 1,
    plugins: 2,
    queries: 10,
    tables: 2,
    ...numbers,
  };
}

const port = 3000;

server.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}.`);
});

server.use((_, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept",
  );
  res.header("Access-Control-Allow-Methods", "GET,PUT,POST,DELETE");
  next();
});

server.use(bodyParser.json());

server.get("/", (_, res) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.json("This is just a development server with mocked data!");
});

mockGetRoute("database/", "control");
mockGetRoute("system", "monitor");
mockGetRoute("storage", "monitor", true);
mockGetRoute("throughput", "monitor");
mockGetRoute("latency", "monitor");
mockGetRoute("queue_length", "monitor");
mockGetRoute("krueger_data", "monitor");
mockGetRoute("chunks", "monitor", true);
mockGetRoute("detailed_query_information", "monitor");
mockGetRoute("status", "monitor");
mockGetRoute("database/benchmark_tables", "control");
mockGetRoute("available_plugins", "control");
mockGetRoute("plugin", "control");
mockGetRoute("plugin_settings", "control", true);
mockGetRoute("plugin_log", "control");

mockPostRoute("database/", "control");
mockPostRoute("database/benchmark_tables", "control");
mockPostRoute("workload/", "control");
mockPostRoute("plugin", "control");

mockDeleteRoute("database/", "control");
mockDeleteRoute("database/benchmark_tables", "control");
mockDeleteRoute("workload/", "control");
mockDeleteRoute("plugin", "control");

function mockGetRoute(
  route: string,
  backendRoute?: "control" | "monitor",
  withBody: boolean = false,
): void {
  const request = getRequestOfRoute(route);
  server.get(getBackendRoute(route, backendRoute), (req, res) => {
    logRequest(req, res);
    const response = withBody
      ? { body: mocks.getMockedResponse(request) }
      : mocks.getMockedResponse(request);
    res.send(response);
  });
}

function logRequest(req, res): void {
  console.log(
    `${new Date().toLocaleTimeString()} - ${req.method} - ${res.statusCode} - ${
      req.url
    }`,
  );
}

function mockPostRoute(
  route: string,
  backendRoute?: "control" | "monitor",
): void {
  const request = getRequestOfRoute(route);
  server.post(getBackendRoute(route, backendRoute), (req, res) => {
    logRequest(req, res);
    mocks.getMockedPostCallback(request)(handleRequestBody(request, req));
    res.send({});
  });
}

function mockDeleteRoute(
  route: string,
  backendRoute?: "control" | "monitor",
): void {
  const request = getRequestOfRoute(route);
  server.delete(getBackendRoute(route, backendRoute), (req, res) => {
    logRequest(req, res);
    mocks.getMockedDeleteCallback(request)(handleRequestBody(request, req));
    res.send({});
  });
}

function handleRequestBody(request: Request, req): string {
  let id = "";
  if (request === "database") {
    id = req.body.id;
  } else if (request === "benchmark_tables") {
    id = req.body.folder_name;
  } else if (request === "plugin") {
    id = req.body.plugin;
  }
  return id;
}

function getRequestOfRoute(route: string): Request {
  const split = route.split("/");
  if (split.length === 1) {
    return split[0] as Request;
  } else {
    if (split[split.length - 1] === "") {
      return split[split.length - 2] as Request;
    }
    return split[split.length - 1] as Request;
  }
}

function getBackendRoute(
  route: string,
  prefix?: "control" | "monitor",
): string {
  return prefix ? `/${prefix}/${route}` : `/${route}`;
}
