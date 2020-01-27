<template>
  <Barchart
    :data="data"
    graph-id="Krueger"
    :chart-configuration="chartConfiguration"
  />
</template>

<script lang="ts">
import {
  createComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref,
  watch
} from "@vue/composition-api";

import { useKruegerService } from "../services/workloadService";
import * as Plotly from "plotly.js";
import Vue from "vue";
import Barchart from "./charts/Barchart.vue";

interface Data {
  data: Ref<any>;
  chartConfiguration: string[];
}

interface Props {}

export default createComponent({
  name: "Throughput",
  components: { Barchart },
  setup(props: Props, context: SetupContext): Data {
    const { databases } = context.root.$databaseData;
    const { data, checkState } = useKruegerService();

    const chartConfiguration = ["Krueger", "Workloads", "amout of queries"];

    onMounted(() => {
      setInterval(checkState, 5000);
    });

    return {
      data,
      chartConfiguration
    };
  }
});
</script>
