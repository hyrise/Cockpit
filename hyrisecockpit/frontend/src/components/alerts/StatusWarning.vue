<template>
  <span>
    <v-row class="warningRow ml-1" >
    <warning v-if="!availableDatabases.length">
      <template #message>
        No database added
      </template>
    </warning>
    <warning v-if="databases.length" :condition="selectedDatabases">
      <template #message>
        No database selected
      </template>
    </warning>
    <warning :condition="selectedMetrics">
      <template #message>
        No metric selected
      </template>
    </warning>
    <v-row>
      <div v-for="database in databases" :key="database.id">
        <warning v-if="!database.active" class="mx-4">
          <template #message> {{ database.id }} is not active </template>
        </warning>
        <v-chip
          v-if="database.blocked"
          class="mx-4 mt-4 mb-1 py-2 white--text"
          :color="database.color"
        >
          <v-icon> mdi-exclamation </v-icon>
          <span> {{ database.id }} is blocked </span>
        </v-chip>
      </div>
    </v-row> 
   </v-row>
  </span>

</template>
<script lang="ts">
import {
  defineComponent,
  SetupContext,
  computed,
  Ref,
  ref,
} from "@vue/composition-api";
import Warning from "./Warning.vue";
import { Database } from "@/types/database";
import { useUpdatingDatabases } from "@/meta/databases";

interface Props {
  selectedDatabases: string[];
  selectedMetrics: string[];
}
interface Data {
  availableDatabases: Ref<readonly string[]>;
  databases: Ref<readonly Database[]>;
}

export default defineComponent({
  name: "StatusWarning",
  props: {
    selectedDatabases: {
      type: Array,
      default: null,
    },
    selectedMetrics: {
      type: Array,
      default: null,
    },
  },
  components: {
    Warning,
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      availableDatabases: computed(
        () => context.root.$databaseController.availableDatabasesById.value
      ),
      ...useUpdatingDatabases(props, context),
    };
  },
});
</script>
<style scoped>
.warningRow {
  position: sticky;
  top: 2px;
  z-index: 5;
}
</style>
