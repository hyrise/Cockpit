<template>
  <div class="ml-6">
    <MetricsTileList :selected-databases="$route.params.id" />
  </div>
</template>

<script lang="ts">
import { createComponent, SetupContext } from "@vue/composition-api";
import MetricsTileList from "../components/MetricsTileList.vue";

interface Data {}

export default createComponent({
  components: {
    MetricsTileList
  },
  setup(props: {}, context: SetupContext): Data {
    return {};
  }
});
</script>
