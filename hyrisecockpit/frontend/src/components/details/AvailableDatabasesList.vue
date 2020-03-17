<template>
  <v-list>
    <v-subheader>DATABASES</v-subheader>
    <v-list-item v-for="database in databases" :key="database.id">
      <v-list-item-icon>
        <v-icon :color="database.color">mdi-database</v-icon>
      </v-list-item-icon>
      <v-list-item-title>{{ database.id }}</v-list-item-title>
    </v-list-item>
  </v-list>
</template>

<script lang="ts">
import {
  SetupContext,
  defineComponent,
  ref,
  Ref,
  computed
} from "@vue/composition-api";
import { Database } from "@/types/database";

interface Data {
  databases: Ref<readonly Database[]>;
}

export default defineComponent({
  setup(props: {}, context: SetupContext): Data {
    const {
      getDatabasesByIds,
      availableDatabasesById
    } = context.root.$databaseController;
    return {
      databases: computed(() =>
        getDatabasesByIds(availableDatabasesById.value as string[])
      )
    };
  }
});
</script>
