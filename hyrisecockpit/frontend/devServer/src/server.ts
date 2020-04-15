import { Entity, Request } from "../../tests/e2e/setup/helpers";
import { useMocks } from "../../tests/e2e/setup/mocks";

import express from "express";

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
    ...numbers
  };
}

const port = 3000;

server.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}.`);
});

server.get("/", (req, res) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.json("This is just a development server with mocked data!");
});

mockGetRoute("database", "control");
mockGetRoute("system", "monitor");
mockGetRoute("storage", "monitor", true);
mockGetRoute("throughput", "monitor");
mockGetRoute("latency", "monitor");
mockGetRoute("queue_length", "monitor");
mockGetRoute("krueger_data", "monitor");
mockGetRoute("chunks", "monitor", true);
mockGetRoute("detailed_query_information", "monitor");
mockGetRoute("status", "monitor");
mockGetRoute("data", "control");
mockGetRoute("available_plugins", "control");
mockGetRoute("plugin", "control");
mockGetRoute("plugin_settings", "control", true);
mockGetRoute("plugin_log", "control");

mockPostRoute("database", "control");

function mockGetRoute(
  request: Request,
  backendRoute: "control" | "monitor",
  withBody: boolean = false
): void {
  server.get(`/${backendRoute}/${request}`, (req, res) => {
    logRequest(req, res);
    res.header("Access-Control-Allow-Origin", "*");
    const response = withBody
      ? { body: mocks.getMockedResponse(request) }
      : mocks.getMockedResponse(request);
    res.send(response);
  });
}

function logRequest(req, res): void {
  console.log(
    new Date().toLocaleTimeString() +
    " - " +
    req.url +
    " - " +
    req.method +
    " - " +
    res.statusCode
  );
}

function mockPostRoute(
  request: Request,
  backendRoute: "control" | "monitor"
): void {
  server.post(`/${backendRoute}/${request}`, (req, res) => {
    logRequest(req, res);
    console.log(req.body);

    res.header("Access-Control-Allow-Origin", "*");
    res.send({});
  });
}
