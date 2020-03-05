import { ChartConfiguration } from "./metrics";

export interface ChartProps {
  selectedDatabases: string[];
  graphId: string;
  maxChartWidth: number;
  chartConfiguration: ChartConfiguration;
}

export const ChartPropsValidation = {
  selectedDatabases: {
    type: Array,
    default: null
  },
  graphId: {
    type: String,
    default: null
  },
  maxChartWidth: {
    type: Number,
    default: 0
  },
  chartConfiguration: {
    type: Object,
    default: null
  }
};
