<template>
  <span>
    <warning v-if="!databases.length">
      <template #message>
        No database added
      </template>
    </warning>
    <v-row>
      <div v-for="database in databases" :key="database.id">
        <warning class="mx-4" v-if="!database.active">
          <template #message> {{ database.id }} is not active </template>
        </warning>
        <v-chip
          class="mx-4 mt-4 mb-1 py-2 white--text"
          v-if="database.blocked"
          :color="database.color"
        >
          <v-icon> mdi-exclamation </v-icon>
          <span> {{ database.id }} is blocked </span>
        </v-chip>
      </div>
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
}
interface Data {
  databases: Ref<readonly Database[]>;
}

export default defineComponent({
  name: "StatusWarning",
  props: {
    selectedDatabases: {
      type: Array,
      default: null,
    },
  },
  components: {
    Warning,
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      ...useUpdatingDatabases(props, context),
    };
  },
});
</script>
