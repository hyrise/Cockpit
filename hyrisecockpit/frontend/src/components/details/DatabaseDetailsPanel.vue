<template>
  <panel-template id="database-details-panel" :show-panel="showDetailsPanel">
    <template #header>
      <div class="white--text">
        Database System Information
      </div>
    </template>
    <template #content>
      <database-system-details :selected-databases="selectedDatabases" />
    </template>
  </panel-template>
</template>

<script lang="ts">
import { defineComponent, SetupContext, Ref, ref } from "@vue/composition-api";
import DatabaseSystemDetails from "./DatabaseSystemDetails.vue";
import PanelTemplate from "@/components/container/PanelTemplate.vue";

interface Props {
  selectedDatabases: string[];
}
interface Data {
  showDetailsPanel: Ref<boolean>;
}

export default defineComponent({
  name: "DatabaseDetailsPanel",
  props: {
    selectedDatabases: {
      type: Array,
      default: null,
    },
  },
  components: { DatabaseSystemDetails, PanelTemplate },
  setup(props: Props, context: SetupContext): Data {
    return {
      showDetailsPanel: ref(true),
    };
  },
});
</script>
