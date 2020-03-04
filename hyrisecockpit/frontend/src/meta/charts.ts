import * as Plotly from "plotly.js";
import { watch, Ref, SetupContext } from "@vue/composition-api";

export function useResizingOnDatabaseChange(
  graphId: string,
  availableSize: Ref<number>,
  length: Ref<number>
): any {
  watch(
    () => length,
    () => {
      resizeChart();
    }
  );
  function resizeChart(): void {
    console.log("resize", length.value);
    Plotly.relayout(graphId, {
      width: Math.floor(availableSize.value / length.value)
    });
  }
}
