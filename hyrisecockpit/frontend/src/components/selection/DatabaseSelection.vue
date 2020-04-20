<template>
  <v-list class="list">
    <v-card flat>
      <v-card-title class="header subtitle-1">
        DATABASES
      </v-card-title>
    </v-card>
    <v-list-item v-for="database in databases" :key="database">
      <v-list-item-title>
        <database-chip
          :database-id="database"
          :selected="selectedDatabases[database]"
          :selectable="true"
          @toggleSelected="handleDatabaseSelection"
        />
      </v-list-item-title>
    </v-list-item>
  </v-list>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  watch,
  computed,
  reactive,
  Ref,
  ref,
  onMounted,
} from "@vue/composition-api";

import { Database } from "@/types/database";
import DatabaseChip from "@/components/details/DatabaseChip.vue";
import { useDatabaseEvents } from "@/meta/events";

interface Props {
  initialDatabases: string[];
}

interface Data {
  databases: Ref<readonly string[]>;
  selectedDatabases: Ref<Record<string, boolean>>;
  handleDatabaseSelection: (databaseId: string, value: boolean) => void;
}

export default defineComponent({
  props: {
    initialDatabases: {
      type: Array,
      default: () => [],
    },
  },

  components: { DatabaseChip },
  setup(props: Props, context: SetupContext): Data {
    const selectedDatabases = ref<Record<string, boolean>>({});

    const { databasesUpdated } = context.root.$databaseController;

    watch(
      () => databasesUpdated.value,
      () => {
        context.root.$databaseController.availableDatabasesById.value.forEach(
          (database: any) => {
            selectedDatabases.value[database] = false;
          }
        );
      }
    );
    watch(
      () => props.initialDatabases,
      () => {
        const newSelected: Record<string, boolean> = {};
        Object.keys(selectedDatabases.value).forEach((database) => {
          newSelected[database] = props.initialDatabases.includes(database);
        });
        selectedDatabases.value = JSON.parse(JSON.stringify(newSelected));
      }
    );

    function handleDatabaseSelection(databaseId: string, value: boolean): void {
      context.emit("selectionChanged", databaseId, value);
    }

    return {
      databases: computed(
        () => context.root.$databaseController.availableDatabasesById.value
      ),
      handleDatabaseSelection,
      selectedDatabases,
    };
  },
});
</script>
