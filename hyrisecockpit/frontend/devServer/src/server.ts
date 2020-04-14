import { useMocks } from "../../tests/e2e/setup/mocks";

import express from "express";
const server = express();
const mocks = useMocks(getInitialNumbers({}));

function getInitialNumbers(numbers) {
  return {
    databases: 1,
    tables: 2,
    columns: 2,
    chunks: 2,
    queries: 10,
    plugins: 2,
    activated_plugins: 1,
    loaded_benchmarks: 1,
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

server.get("/control/database", (req, res) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.send(mocks.getMockedResponse("database"));
});

server.get("/monitor/system", (req, res) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.send(mocks.getMockedResponse("system"));
});

server.get("/monitor/storage", (req, res) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.send({ body: mocks.getMockedResponse("storage") });
});

server.get("/monitor/throughput", (req, res) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.send(mocks.getMockedResponse("throughput"));
});

server.get("/monitor/latency", (req, res) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.send(mocks.getMockedResponse("latency"));
});

server.get("/monitor/queue_length", (req, res) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.send(mocks.getMockedResponse("queue_length"));
});

server.get("/monitor/krueger_data", (req, res) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.send(mocks.getMockedResponse("krueger_data"));
});

server.get("/monitor/chunks", (req, res) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.send({ body: mocks.getMockedResponse("chunks") });
});

server.get("/monitor/detailed_query_information", (req, res) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.send(mocks.getMockedResponse("detailed_query_information"));
});

server.get("/monitor/status", (req, res) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.send(mocks.getMockedResponse("status"));
});

server.get("/control/data", (req, res) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.send(mocks.getMockedResponse("data"));
});

server.get("/control/available_plugins", (req, res) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.send(mocks.getMockedResponse("available_plugins"));
});

server.get("/control/plugin", (req, res) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.send(mocks.getMockedResponse("plugin"));
});

server.get("/control/plugin_settings", (req, res) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.send({ body: mocks.getMockedResponse("plugin_settings") });
});

server.get("/control/plugin_log", (req, res) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.send(mocks.getMockedResponse("plugin_log"));
});
