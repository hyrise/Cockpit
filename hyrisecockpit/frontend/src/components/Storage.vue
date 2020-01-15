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
  ref,
  onMounted
} from "@vue/composition-api";
import { useGenericFetchService } from "../services/genericFetchService";
import * as Plotly from "plotly.js";
import Treemap from "./charts/Treemap.vue";
import { ComponentProps, ComponentPropsValidation } from "../types/components";

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
  props: ComponentPropsValidation,
  setup(props: ComponentProps, context: SetupContext): Data {
    const { data, checkState } = useGenericFetchService(props.component);

    const labels = ref<string[]>([]);
    const parents = ref<string[]>([]);
    const sizes = ref<number[]>([]);
    const chartConfiguration = ref<string[]>([props.preselectedDatabaseId]);

    checkState();
    onMounted(() => {
      setInterval(checkState, 5000);
    });

    watch(data, () => {
      if (Object.keys(data.value).length) {
        const {
          newLabels,
          newParents,
          newSizes
        } = props.component.transformationService(
          data.value,
          props.preselectedDatabaseId
        );
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
