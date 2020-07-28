<template>
  <div data-id="metric-detailed-view">
    <v-dialog v-model="showDialog" hide-overlay>
      <template v-slot:activator="{ on }">
        <v-btn
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
      <v-card class="detailed-view" data-id="detailed-view">
        <v-system-bar :height="50" color="secondary">
          <v-spacer />
          <v-card-title class="subtitle-1">
            <slot name="header" />
          </v-card-title>
          <v-spacer />
          <v-icon
            :data-id="`close-metric-detailed-view-${metric}`"
            @click="showDialog = false"
            >mdi-close</v-icon
          >
        </v-system-bar>
        <v-card-content>
          <slot name="content" />
        </v-card-content>
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
