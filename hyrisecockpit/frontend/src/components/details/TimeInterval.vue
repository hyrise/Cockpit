<template>
  <v-card color="primary" dark>
    <v-card-text>
      <v-icon>mdi-clock-outline</v-icon>
      <b class="ml-2 white--text">{{ interval }}</b>
    </v-card-text>
  </v-card>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref
} from "@vue/composition-api";
import { Metric } from "@/types/metrics";
import { useUpdatingInterval } from "@/meta/components";

interface Props {
  metric: Metric;
}
interface Data {
  interval: Ref<string>;
}

export default defineComponent({
  name: "TimeInterval",
  props: {
    metric: {
      type: String,
      default: null
    }
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      interval: useUpdatingInterval(context, props.metric)
    };
  }
});
</script>
