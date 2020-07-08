import { testLinechartOnComparison, testLinechartOnOverview } from "./helpers";

const metric = "ram";
const request = "system";
const layout = { title: "Memory usage in %", min: 0, max: 105 };
const transform = (data: any, xhr: any): any => {
  data = {};
  xhr.response.body.forEach((entry: any) => {
    data[entry.id] = 100 - entry.system_data[0].system_data.memory.percent;
  });
  return data;
};

/* test on overview */
testLinechartOnOverview(metric, request, layout, transform);

/* test on comparison */
testLinechartOnComparison(metric, request, layout, transform);
