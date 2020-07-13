import {
  testLinechartOnComparison,
  testLinechartOnOverview,
} from "./abstractTests";
import { assignToObject } from "../helpers";

const metric = "queueLength";
const request = "queue_length";
const layout = { title: "Number of queries", min: 0 };
const transform = (xhr: any): any => {
  return assignToObject(xhr.response.body, "queue_length");
};

/* test on overview */
testLinechartOnOverview(metric, request, layout, transform);

/* test on comparison */
testLinechartOnComparison(metric, request, layout, transform);
