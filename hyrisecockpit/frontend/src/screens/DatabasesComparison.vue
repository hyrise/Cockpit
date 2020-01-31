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
      outlined
      prepend-icon="mdi-database"
    ></v-select>
    <MetricsTileList
      :selected-databases="watchedInstances"
      :show-details="false"
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
<style scoped>
.select {
  padding-top: 20px;
  width: 33%;
}
</style>
