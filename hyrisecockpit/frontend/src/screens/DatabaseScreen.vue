<template>
  <div>
    <div class="linechart mx-12">
      <div class="mt-6 mb-2">
        <b> Throughput Monitoring </b>
      </div>
      <v-divider class="mb-4"></v-divider>
      <Throughput
        :preselectedDatabaseId="$route.params.id"
        :component="getComponent('throughput')"
      />
      <div class="mt-6 mb-2">
        <b> CPU Monitoring </b>
      </div>
      <v-divider class="mb-4"></v-divider>
      <Cpu
        :preselectedDatabaseId="$route.params.id"
        :component="getComponent('cpu')"
      />
      <div class="mt-6 mb-2">
        <b> Access frequency Monitoring </b>
      </div>
      <v-divider class="mb-4"></v-divider>
      <Access
        :preselectedDatabaseId="$route.params.id"
        :component="getComponent('access')"
      />
      <div class="mt-6 mb-2">
        <b> Storage Monitoring </b>
      </div>
      <v-divider class="mb-4"></v-divider>
      <Storage
        :preselectedDatabaseId="$route.params.id"
        :component="getComponent('storage')"
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
import { useDatabaseFetchService } from "../services/databaseService";
import { componentMap } from "../components/components";
import { ComponentId, Component } from "../types/components";

interface Data {
  getComponent: (component: ComponentId) => Component;
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
    function getComponent(component: ComponentId): Component {
      return componentMap[component];
    }
    return {
      getComponent
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
