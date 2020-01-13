<template>
  <div>
    <div class="linechart mx-12">
      <div class="mt-6 mb-2">
        <b> Throughput Monitoring </b>
      </div>
      <v-divider class="mb-4"></v-divider>
      <Throughput :preselectedDatabaseId="$route.params.id" />
      <div class="mt-6 mb-2">
        <b> CPU Monitoring </b>
      </div>
      <v-divider class="mb-4"></v-divider>
      <Cpu :preselectedDatabaseId="$route.params.id" />
      <div class="mt-6 mb-2">
        <b> Access frequency Monitoring </b>
      </div>
      <v-divider class="mb-4"></v-divider>
      <Access />
      <div class="mt-6 mb-2">
        <b> Storage Monitoring </b>
      </div>
      <v-divider class="mb-4"></v-divider>
      <Storage />
    </div>
  </div>
</template>

<script lang="ts">
import {
  createComponent,
  SetupContext,
  onMounted,
  Ref,
  ref
} from "@vue/composition-api";
import Throughput from "../components/Throughput.vue";
import Storage from "../components/Storage.vue";
import Cpu from "../components/Cpu.vue";
import Access from "../components/Access.vue";
import { useDatabaseFetchService } from "../services/databaseService";

interface Props {}
interface Data {
  isReady: Ref<boolean>;
}

export default createComponent({
  name: "DatabaseScreen",

  components: {
    Throughput,
    Storage,
    Cpu,
    Access
  },

  setup(props: Props, context: SetupContext): Data {
    const { isReady } = context.root.$databaseData.isReady;
    return { isReady };
  }
});
</script>
<style scoped>
.linechart {
  max-width: 1800px;
  max-height: 1000px;
}
</style>
