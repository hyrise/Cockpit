import {
  testLinechartOnComparison,
  testLinechartOnOverview,
} from "./abstractTests";
import { assignToObject } from "../helpers";

const metric = "memoryFootprint";
const request = "memory_footprint";
const layout = { title: "Memory Footprint in MB", min: 0 };
const transform = (xhr: any): any => {
  return assignToObject(xhr.response.body, "memory_footprint");
};

/* test on overview */
testLinechartOnOverview(metric, request, layout, transform);

/* test on comparison */
testLinechartOnComparison(metric, request, layout, transform);