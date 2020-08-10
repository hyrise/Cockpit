import {
  testLinechartOnComparison,
  testLinechartOnOverview,
} from "./abstractTests";
import { assignToObject } from "../helpers";

const metric = "negativeThroughput";
const request = "negative_throughput";
const layout = {
  title: "Number of aborted transactions / s",
  min: 0,
};
const transform = (xhr: any): any => {
  return assignToObject(xhr.response.body, "negative_throughput");
};

/* test on overview */
testLinechartOnOverview(metric, request, layout, transform);

/* test on comparison */
testLinechartOnComparison(metric, request, layout, transform);
