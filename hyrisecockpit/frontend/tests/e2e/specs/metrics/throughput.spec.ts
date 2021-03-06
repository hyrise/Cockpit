import {
  testLinechartOnComparison,
  testLinechartOnOverview,
} from "./abstractTests";
import { assignToObject } from "../helpers";

const metric = "throughput";
const request = "throughput";
const layout = { title: "Number of queries / s", min: 0 };
const transform = (xhr: any): any => {
  return assignToObject(xhr.response.body, "throughput");
};

/* test on overview */
testLinechartOnOverview(metric, request, layout, transform);

/* test on comparison */
testLinechartOnComparison(metric, request, layout, transform);
