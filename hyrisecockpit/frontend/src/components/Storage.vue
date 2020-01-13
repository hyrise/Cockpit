<template>
  <div class="treemap mx-10 my-10">
    <Treemap
      graph-id="storage"
      :labels="labels"
      :parents="parents"
      :values="sizes"
      :chart-configuration="chartConfiguration"
    />
  </div>
</template>

<script lang="ts">
import {
  createComponent,
  SetupContext,
  watch,
  Ref,
  ref
} from "@vue/composition-api";
import { useGenericFetchService } from "../services/genericFetchService";
import * as Plotly from "plotly.js";
import Treemap from "./charts/Treemap.vue";
import { useDataTransformation } from "../services/helpers/dataTransformationService";

interface Props {}

interface Data {
  labels: Ref<string[]>;
  parents: Ref<string[]>;
  sizes: Ref<number[]>;
  chartConfiguration: Ref<string[]>;
}

export default createComponent({
  components: {
    Treemap
  },
  setup(props: Props, context: SetupContext): Data {
    const { data, getData } = useGenericFetchService("storage");
    const transformData = useDataTransformation("storage");

    const labels = ref<string[]>([]);
    const parents = ref<string[]>([]);
    const sizes = ref<number[]>([]);
    const chartConfiguration = ref<string[]>(["citadelle"]);

    watch(data, () => {
      if (data.value != {}) {
        const { newLabels, newParents, newSizes } = transformData(data.value);
        labels.value = newLabels;
        parents.value = newParents;
        sizes.value = newSizes;
      }
    });
    return { labels, parents, sizes, chartConfiguration };
  }
});
</script>
<style>
.treemap {
  width: 100%;
}
</style>
