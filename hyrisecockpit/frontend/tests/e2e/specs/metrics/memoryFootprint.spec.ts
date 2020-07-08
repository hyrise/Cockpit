import { testLinechartOnComparison, testLinechartOnOverview } from "./helpers";
import { getDatabaseMemoryFootprint } from "../databases/helpers";

const metric = "memoryFootprint";
const request = "storage";
const layout = { title: "Memory Footprint in MB", min: 0 };
const transform = (data: any, xhr: any): any => {
  data = {};
  Object.entries(xhr.response.body.body.storage).forEach(([key, entry]) => {
    data[key] = getDatabaseMemoryFootprint(entry);
  });
  return data;
};

/* test cpu on overview */
testLinechartOnOverview(metric, request, layout, transform);

/* test cpu on comparison */
testLinechartOnComparison(metric, request, layout, transform);
