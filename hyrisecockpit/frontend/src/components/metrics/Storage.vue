<template>
  <div class="mx-10 my-10">
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
import { useGenericFetchService } from "../../services/genericFetchService";
import * as Plotly from "plotly.js";
import Treemap from "../charts/Treemap.vue";
import { MetricProps, MetricPropsValidation } from "../../types/metrics";

interface Data {
  labels: Ref<string[]>;
  parents: Ref<string[]>;
  sizes: Ref<number[]>;
  chartConfiguration: Ref<string[]>;
}

export default createComponent({
  name: "Storage",
  components: {
    Treemap
  },
  props: MetricPropsValidation,
  setup(props: MetricProps, context: SetupContext): Data {
    const { data, checkState } = useGenericFetchService(props.metricMeta);

    const labels = ref<string[]>([]);
    const parents = ref<string[]>([]);
    const sizes = ref<number[]>([]);
    const chartConfiguration = ref<string[]>([props.selectedDatabases[0]]);

    onMounted(() => {
      checkState();
      setInterval(checkState, 5000);
    });

    watch(data, () => {
      if (Object.keys(data.value).length) {
        const {
          newLabels,
          newParents,
          newSizes
        } = props.metricMeta.transformationService(
          data.value,
          props.selectedDatabases[0] // not really good style
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
