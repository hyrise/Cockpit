<template>
  <v-tooltip right>
    <template v-slot:activator="{ on }">
      <v-icon right v-on="on">mdi-help-circle-outline</v-icon>
    </template>
    <span v-html="metricDescription" />
  </v-tooltip>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref,
} from "@vue/composition-api";
import { getMetricDescription } from "../../meta/metrics";
import { Metric } from "../../types/metrics";

interface Props {
  metric: Metric;
}
interface Data {
  metricDescription: Ref<string>;
}

export default defineComponent({
  name: "MetricDescriptionTooltip",
  props: {
    metric: {
      type: String,
      default: null,
    },
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      metricDescription: ref(getMetricDescription(props.metric)),
    };
  },
});
</script>
