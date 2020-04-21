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

server.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept",
  );
  res.header("Access-Control-Allow-Methods", "GET,PUT,POST,DELETE");
  next();
});

server.use(bodyParser.json());

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
mockPostRoute("data", "control");
mockPostRoute("workload", "control");
mockPostRoute("plugin", "control");

mockDeleteRoute("database", "control");
mockDeleteRoute("data", "control");
mockDeleteRoute("workload", "control");
mockDeleteRoute("plugin", "control");

function mockGetRoute(
  request: Request,
  backendRoute: "control" | "monitor",
  withBody: boolean = false,
): void {
  server.get(`/${backendRoute}/${request}`, (req, res) => {
    logRequest(req, res);
    const response = withBody
      ? { body: mocks.getMockedResponse(request) }
      : mocks.getMockedResponse(request);
    res.send(response);
  });
}

function logRequest(req, res): void {
  if (!process.env.QUIET) {
    console.log(
      `${new Date().toLocaleTimeString()} - ${req.method} - ${
        res.statusCode
      } - ${req.url}`,
    );
  }
}

function mockPostRoute(
  request: Request,
  backendRoute: "control" | "monitor",
): void {
  server.post(`/${backendRoute}/${request}`, (req, res) => {
    logRequest(req, res);
    mocks.getMockedPostCallback(request)(handleRequestBody(request, req));
    res.send({});
  });
}

function mockDeleteRoute(
  request: Request,
  backendRoute: "control" | "monitor",
): void {
  server.delete(`/${backendRoute}/${request}`, (req, res) => {
    logRequest(req, res);
    mocks.getMockedDeleteCallback(request)(handleRequestBody(request, req));
    res.send({});
  });
}

function handleRequestBody(request: Request, req): string {
  let id = "";
  if (request === "database") {
    id = req.body.id;
  } else if (request === "data") {
    id = req.body.folder_name;
  } else if (request === "plugin") {
    id = req.body.plugin;
  }
  return id;
}
