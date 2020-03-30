x<template>
  <v-card flat>
    <v-card-title class="py-2 px-2">
      <b class="interval secondary--text">{{ interval }}</b>
    </v-card-title>
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
<style scoped>
.interval {
  margin-left: 10px;
  font-size: 12px;
  word-break: normal;
  line-height: normal;
}
</style>
