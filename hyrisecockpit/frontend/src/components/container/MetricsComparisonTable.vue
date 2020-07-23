<template>
  <div id="metric-comparison-table" class="metrics-table">
    <v-card
      class="metrics-column mt-n2"
      :style="databaseFlex"
      v-for="database in databases"
      :key="database.id"
      :color="database.color"
      flat
    >
      <v-card
        v-if="showHeader"
        class="column-top-border"
        :color="database.color"
      >
        <v-card-text class="white--text text-center">
          <strong>
            {{ database.id }}
          </strong>
        </v-card-text>
      </v-card>
      <div v-for="metric in selectedMetrics" :key="metric">
        <metric-tile
          class="metric-card"
          :metric="metric"
          :tile-database="database.id"
          :selected-databases="[database.id]"
          :total-number-of-databases="databases.length"
          :show-details="showDetails"
          :graph-id="`${metric}-${database.id}`"
          :max-chart-width="maxChartWidth"
        />
      </div>
      <v-card class="column-bottom-border" :color="database.color">
        <v-card-text class="white--text text-center">
          {{ database.id }}
        </v-card-text>
      </v-card>
    </v-card>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  Ref,
  ref,
  onMounted,
  computed,
  provide,
} from "@vue/composition-api";
import { ContainerProps, ContainerPropsValidation } from "../../types/views";
import { useDatabaseFlex } from "../../meta/components";
import MetricTile from "@/components/container/MetricTile.vue";
import { Database } from "@/types/database";
import { useUpdatingDatabases } from "@/meta/databases";

interface Data {
  databaseFlex: Readonly<Ref<Object>>;
  maxChartWidth: Readonly<Ref<number>>;
  databases: Ref<readonly Database[]>;
}

export default defineComponent({
  components: {
    MetricTile,
  },
  props: ContainerPropsValidation,
  setup(props: ContainerProps, context: SetupContext): Data {
    const totalViewWidth = ref(0);
    const maxChartWidth = computed(
      () =>
        Math.floor(totalViewWidth.value / props.selectedDatabases.length) - 10
    );
    provide("multipleDatabasesAllowed", false);

    onMounted(() => {
      totalViewWidth.value = document.getElementById(
        "metric-comparison-table"
      )!.offsetWidth;
    });

    return {
      ...useDatabaseFlex(props),
      maxChartWidth,
      ...useUpdatingDatabases(props, context),
    };
  },
});
</script>
<style scoped>
.metrics-table {
  display: flex;
  flex-direction: row;
}
.metrics-column {
  display: flex;
  flex-direction: column;
  margin: 0px 6px 6px 6px;
}
</style>
