<template>
  <v-list id="database-selection" class="list">
    <v-card flat>
      <v-card-title class="header subtitle-1">
        DATABASES
      </v-card-title>
    </v-card>
    <v-list-item v-for="database in databases" :key="database">
      <v-list-item-title>
        <database-chip
          :database-id="database"
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
  onMounted
} from "@vue/composition-api";

import { Database } from "@/types/database";
import DatabaseChip from "@/components/details/DatabaseChip.vue";
import { useDatabaseEvents } from "@/meta/events";

interface Props {}

interface Data {
  databases: Ref<readonly string[]>;
  handleDatabaseSelection: (databaseId: string, value: boolean) => void;
}

export default defineComponent({
  props: {},

  components: { DatabaseChip },
  setup(props: Props, context: SetupContext): Data {
    const selectedDatabases = ref<string[]>([]);
    const { databasesUpdated } = context.root.$databaseController;
    const { emitSelectedDatabasesChangedEvent } = useDatabaseEvents();

    watch(
      () => databasesUpdated,
      () => {
        selectedDatabases.value = context.root.$databaseController
          .availableDatabasesById.value as string[];
      }
    );

    watch(
      () => selectedDatabases,
      () => {
        context.emit("selectionChanged", selectedDatabases.value);
      }
    );

    function handleDatabaseSelection(databaseId: string, value: boolean): void {
      if (value && selectedDatabases.value.length < 4)
        selectedDatabases.value.push(databaseId);
      //TODO: show error message when too many databases are selected
      if (!value)
        selectedDatabases.value = selectedDatabases.value.filter(
          (current: string) => current !== databaseId
        );
    }

    return {
      databases: computed(
        () => context.root.$databaseController.availableDatabasesById.value
      ),
      handleDatabaseSelection
    };
  }
});
</script>
