/* eslint-disable prettier/prettier */
import { useMocking } from "./helpers";

import express from "express";

import bodyParser from "body-parser";

const server = express();
const {
  callActions,
  mockGetRoute,
  mockPostRoute,
  mockDeleteRoute,
  mockPutRoute,
  resetMocks,
} = useMocking(server, !process.env.TEST ? { databases: 2 } : {});

const port = 3000;

server.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}.`);
});

server.use((_, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  res.header("Access-Control-Allow-Methods", "GET,PUT,POST,DELETE");
  next();
});

server.use(bodyParser.json());

/* root */
server.get("/", (_, res) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.json("This is just a development server with mocked data!");
});

/* control */
mockGetRoute("database");
mockGetRoute("benchmark_tables");
mockGetRoute("available_plugins");
mockGetRoute("plugin");
mockGetRoute("plugin_log");

mockPostRoute("database");
mockPostRoute("benchmark_tables");
mockPostRoute("plugin");
mockPostRoute("sql");
mockPostRoute("worker");

mockDeleteRoute("database");
mockDeleteRoute("benchmark_tables");
mockDeleteRoute("plugin");
mockDeleteRoute("worker");

mockPutRoute("plugin");

/* monitor */
mockGetRoute("system");
mockGetRoute("storage", true);
mockGetRoute("chunks", true);
mockGetRoute("workload_statement_information");
mockGetRoute("workload_operator_information");
mockGetRoute("segment_configuration", true);

/* metric */
mockGetRoute("throughput");
mockGetRoute("latency");
mockGetRoute("queue_length");
mockGetRoute("detailed_query_information");

/* status */
mockGetRoute("status_benchmarks");
mockGetRoute("status_database");

/* workload */
mockGetRoute("workload");

mockPostRoute("workload");

mockDeleteRoute("workload");

mockPutRoute("workload");

/* route for manual state cleaning */
server.post("/clean/", (req, res) => {
  callActions(req);
  res.send({});
});

/* route for manual restarting with different numbers */
server.post("/restart/", (req, res) => {
  resetMocks(req.body);
  res.send({});
});
