<template>
  <div>
    <div class="linechart mx-12">
      <div class="mt-6 mb-2">
        <b> Throughput Monitoring </b>
      </div>
      <v-divider class="mb-4"></v-divider>
      <Throughput
        :preselectedDatabaseId="$route.params.id"
        :component-meta="getComponentMeta('throughput')"
      />
      <div class="mt-6 mb-2">
        <b> CPU Monitoring </b>
      </div>
      <v-divider class="mb-4"></v-divider>
      <Cpu
        :preselectedDatabaseId="$route.params.id"
        :component-meta="getComponentMeta('cpu')"
      />
      <div class="mt-6 mb-2">
        <b> Access frequency Monitoring </b>
      </div>
      <v-divider class="mb-4"></v-divider>
      <Access
        :preselectedDatabaseId="$route.params.id"
        :component-meta="getComponentMeta('access')"
      />
      <div class="mt-6 mb-2">
        <b> Storage Monitoring </b>
      </div>
      <v-divider class="mb-4"></v-divider>
      <Storage
        :preselectedDatabaseId="$route.params.id"
        :component-meta="getComponentMeta('storage')"
      />
    </div>
  </div>
</template>

<script lang="ts">
import { createComponent, SetupContext } from "@vue/composition-api";
import Throughput from "../components/Throughput.vue";
import Storage from "../components/Storage.vue";
import Cpu from "../components/Cpu.vue";
import Access from "../components/Access.vue";
import { componentMetaMap } from "../components/componentMeta";
import { ComponentId, ComponentMeta } from "../types/components";

interface Data {
  getComponentMeta: (component: ComponentId) => ComponentMeta;
}

export default createComponent({
  name: "DatabaseScreen",
  components: {
    Throughput,
    Storage,
    Cpu,
    Access
  },
  setup(props: {}, context: SetupContext): Data {
    function getComponentMeta(component: ComponentId): ComponentMeta {
      return componentMetaMap[component];
    }
    return {
      getComponentMeta
    };
  }
});
</script>
<style scoped>
.linechart {
  max-width: 1800px;
  max-height: 1000px;
}
</style>
