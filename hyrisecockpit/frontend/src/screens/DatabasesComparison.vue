<template>
  <div class="ml-6">
    <MetricsTileList :selected-databases="watchedInstances" />
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
import MetricsTileList from "../components/MetricsTileList.vue";

interface Data {
  watchedInstances: Ref<string[]>;
}

export default createComponent({
  components: {
    MetricsTileList
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
    return { watchedInstances };
  }
});
</script>
