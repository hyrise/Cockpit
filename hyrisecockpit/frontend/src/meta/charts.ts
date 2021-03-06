import { watch, SetupContext } from "@vue/composition-api";
import { ChartProps } from "@/types/charts";
import Plotly from "@/../plotlyBundle.ts";

export function useChartReactivity(
  props: ChartProps,
  context: SetupContext,
  updateDataFunction: () => void,
  updateLayoutFunction: () => void
): void {
  const { databasesUpdated } = context.root.$databaseController;

  function isValidData(data: any): boolean {
    return Array.isArray(data)
      ? data.length !== 0 && databasesUpdated.value
      : Object.keys(data).length !== 0 && databasesUpdated.value;
  }

  function isValidLayout(width: number): boolean {
    return width > 0;
  }

  watch(
    () => props.data,
    () => {
      if (isValidData(props.data)) updateDataFunction();
    },
    { immediate: true }
  );
  watch(
    () => props.maxChartWidth,
    () => {
      if (isValidLayout(props.maxChartWidth)) updateLayoutFunction();
    },
    { immediate: true }
  );
}

export function useResizingOnChange(
  props: ChartProps
): { updateLayout: () => void } {
  function updateLayout(): void {
    Plotly.relayout(props.graphId, {
      width: props.maxChartWidth - 25,
    });
  }

  return { updateLayout };
}
