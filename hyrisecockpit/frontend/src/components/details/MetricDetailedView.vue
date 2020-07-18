<template>
  <div data-id="metric-detailed-view" class="mx-10 my-10">
    <v-dialog v-model="showDialog" hide-overlay>
      <template v-slot:activator="{ on }">
        <v-btn
          class="mt-n10 ml-4"
          outlined
          color="secondary"
          elevation="2"
          small
          v-on="on"
          :data-id="`open-metric-detailed-view-${metric}`"
        >
          <v-icon color="primary" size="18">mdi-magnify-plus</v-icon>
        </v-btn>
      </template>
      <v-card>
        <v-card-title class="metric-title">
          <slot name="header" />
        </v-card-title>
        <v-spacer />
        <v-card-text>
          <slot name="content" />
        </v-card-text>
        <v-card-actions>
          <v-btn
            block
            color="primary"
            :data-id="`close-metric-detailed-view-${metric}`"
            @click="showDialog = false"
            >Close detailed view</v-btn
          >
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  watch,
  Ref,
  ref,
  onMounted,
} from "@vue/composition-api";
import { Metric } from "@/types/metrics";

interface Data {
  showDialog: Ref<boolean>;
}

interface Props {
  metric: Metric;
}

export default defineComponent({
  name: "MetricDetailedView",
  props: {
    metric: {
      type: String,
      default: "",
    },
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      showDialog: ref(false),
    };
  },
});
</script>
<style scoped>
.metric-title {
  justify-content: center;
}
</style>
