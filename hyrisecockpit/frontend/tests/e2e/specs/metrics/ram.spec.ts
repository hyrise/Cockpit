import {
  testLinechartOnComparison,
  testLinechartOnOverview,
} from "./abstractTests";

const metric = "ram";
const request = "system";
const layout = { title: "Memory usage in %", min: 0, max: 105 };
const transform = (xhr: any): any => {
  const data: any = {};
  xhr.response.body.forEach((entry: any) => {
    data[entry.id] =
      (1 - entry.system_data[0].system_data.memory.percent) * 100;
  });
  return data;
};

/* test on overview */
testLinechartOnOverview(metric, request, layout, transform);

/* test on comparison */
testLinechartOnComparison(metric, request, layout, transform);
