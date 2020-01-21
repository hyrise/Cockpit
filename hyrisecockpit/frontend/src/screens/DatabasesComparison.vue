<template>
  <div class="ml-6">
    <MetricsTileList :selected-databases="watchedInstances" />
  </div>
</template>

<script lang="ts">
import { createComponent, SetupContext } from "@vue/composition-api";
import MetricsTileList from "../components/MetricsTileList.vue";

interface Data {
  watchedInstances: string[];
}

export default createComponent({
  components: {
    MetricsTileList
  },
  setup(props: {}, context: SetupContext): Data {
    const watchedInstances = context.root.$databaseData.databases.value.map(
      database => database.id
    );
    return { watchedInstances };
  }
});
</script>
