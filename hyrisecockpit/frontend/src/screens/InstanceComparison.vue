<template>
  <div class="mx-6">
    <v-select
      v-if="$databaseData.isReady"
      class="select"
      v-model="watchedInstances"
      v-on:input="handleMaxSelected"
      :items="$databaseData.databases.value.map(database => database.id)"
      chips
      label="databases"
      multiple
      counter="4"
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

interface Data extends ScreenData {
  handleMaxSelected: () => void;
}

export default createComponent({
  components: {
    MetricsComparisonTable
  },
  setup(props: {}, context: SetupContext): Data {
    const watchedInstances = ref<string[]>([]);

    const { isReady } = context.root.$databaseData;
    watch(isReady, () => {
      if (isReady.value) {
        watchedInstances.value = context.root.$databaseData.databases.value.map(
          database => database.id
        );
      }
    });

    function handleMaxSelected() {
      if (watchedInstances.value.length > 4) {
        watchedInstances.value.pop();
      }
    }
    return { watchedInstances, handleMaxSelected };
  }
});
</script>
<style scoped>
.select {
  padding-top: 20px;
  width: 33%;
}
</style>
