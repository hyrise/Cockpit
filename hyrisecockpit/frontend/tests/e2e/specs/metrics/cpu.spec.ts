import {
  testLinechartOnComparison,
  testLinechartOnOverview,
} from "./abstractTests";

const metric = "cpu";
const request = "system";
const layout = { title: "Workload in %", min: 0, max: 105 };
const transform = (xhr: any): any => {
  const data: any = {};
  xhr.response.body.forEach((entry: any) => {
    data[entry.id] = entry.system_data[0].system_data.cpu.cpu_process_usage;
  });

  return data;
};

/* test on overview */
testLinechartOnOverview(metric, request, layout, transform);

/* test on comparison */
testLinechartOnComparison(metric, request, layout, transform);
