<template>
  <v-progress-linear
    v-if="loading || databasesLoading || metricsLoading"
    indeterminate
    :color="color"
    height="7"
  />
</template>
<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref,
  watch
} from "@vue/composition-api";
import { eventBus } from "../../plugins/eventBus";

interface Data extends DatabaseChangeAnimation, MetricChangeAnimation {
  loading: Ref<boolean>;
}

interface Props {
  conditions: Ref<boolean>[];
  evaluations: boolean[];
  color: string;
}

export default defineComponent({
  name: "LinearLoader",
  props: {
    conditions: {
      type: Array,
      default: () => []
    },
    evaluations: {
      type: Array,
      default: () => []
    },
    color: {
      type: String,
      default: "#02789d"
    }
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      loading: computed(() =>
        props.conditions.reduce(
          (isLoading: boolean, condition: Ref<boolean>, idx: number) =>
            condition.value === props.evaluations[idx] || isLoading,
          false
        )
      ),
      ...useDatabaseChangeAnimation(),
      ...useMetricChangeAnimation()
    };
  }
});

interface DatabaseChangeAnimation {
  databasesLoading: Ref<boolean>;
}

function useDatabaseChangeAnimation(): DatabaseChangeAnimation {
  const databasesLoading = ref(false);
  eventBus.$on("SELECTED_DATABASES_CHANGED", (databases: string[]) => {
    databasesLoading.value = true;
    setTimeout(() => {
      databasesLoading.value = false;
    }, Math.floor(500 + 100 * databases.length));
  });
  return { databasesLoading };
}

interface MetricChangeAnimation {
  metricsLoading: Ref<boolean>;
}

function useMetricChangeAnimation(): MetricChangeAnimation {
  const metricsLoading = ref(false);
  eventBus.$on("SELECTED_METRICS_CHANGED", (metrics: string[]) => {
    metricsLoading.value = true;
    setTimeout(() => {
      metricsLoading.value = false;
    }, Math.floor(300 + 50 * metrics.length));
  });
  return { metricsLoading };
}
</script>
<style scoped></style>
