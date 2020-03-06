import { watch, SetupContext } from "@vue/composition-api";
import { ChartProps } from "@/types/charts";
import * as Plotly from "plotly.js";

export function useChartReactivity(
  props: ChartProps,
  context: SetupContext,
  updateDataFunction: () => void,
  updateLayoutFunction: () => void
): void {
  const { databasesUpdated } = context.root.$databaseController;

  function isValidData(data: any): boolean {
    return Array.isArray(data)
      ? props.data.length !== 0 && databasesUpdated.value
      : Object.keys(props.data).length !== 0 && databasesUpdated.value;
  }

  watch(
    () => props.data,
    () => {
      if (isValidData(props.data)) updateDataFunction();
    }
  );
  watch(
    () => props.maxChartWidth,
    () => {
      if (props.maxChartWidth !== 0) updateLayoutFunction();
    }
  );
}

export function useResizingOnChange(
  props: ChartProps
): { updateLayout: () => void } {
  function updateLayout(): void {
    Plotly.relayout(props.graphId, {
      width: props.maxChartWidth
    });
  }

  return { updateLayout };
}
