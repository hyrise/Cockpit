<template>
  <div class="mx-6">
    <v-select
      v-if="$databaseData.isReady"
      class="select"
      v-model="watchedInstances"
      :items="$databaseData.databases.value.map(database => database.id)"
      chips
      label="databases"
      multiple
      counter="2"
      outlined
      prepend-icon="mdi-database"
    ></v-select>
    <MetricsComparisonTable
      :selected-databases="watchedInstances"
      :show-details="true"
    />
  </div>
</template>

<script lang="ts">
import {
  createComponent,
  SetupContext,
  watch,
  computed,
  Ref,
  ref
} from "@vue/composition-api";
import MetricsComparisonTable from "../components/container/MetricsComparisonTable.vue";
import { ScreenData } from "../types/screens";

export default createComponent({
  components: {
    MetricsComparisonTable
  },
  setup(props: {}, context: SetupContext): ScreenData {
    const watchedInstances = ref<string[]>([]);

    const { isReady } = context.root.$databaseData;
    watch(isReady, () => {
      if (isReady.value) {
        watchedInstances.value = context.root.$databaseData.databases.value.map(
          database => database.id
        );
      }
    });
    return { watchedInstances };
  }
});
</script>
<style scoped>
.select {
  padding-top: 20px;
  width: 33%;
}
</style>
