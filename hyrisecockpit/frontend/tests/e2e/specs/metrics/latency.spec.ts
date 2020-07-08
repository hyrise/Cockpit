import { testLinechartOnComparison, testLinechartOnOverview } from "./helpers";
import { roundNumber } from "../helpers";

const metric = "latency";
const request = "latency";
const layout = { title: "Latency in ms", min: 0 };
const transform = (data: any, xhr: any): any => {
  data = {};
  xhr.response.body.forEach((entry: any) => {
    data[entry.id] = roundNumber(entry.latency[0].latency, Math.pow(10, 6));
  });

  return data;
};

/* test on overview */
testLinechartOnOverview(metric, request, layout, transform);

/* test on comparison */
testLinechartOnComparison(metric, request, layout, transform);
