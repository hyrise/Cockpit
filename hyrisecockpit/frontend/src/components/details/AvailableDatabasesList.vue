<template>
  <v-list class="list">
    <v-card flat>
      <v-card-title class="header subtitle-1">
        DATABASES
        <v-spacer />
        <v-tooltip bottom>
          <template v-slot:activator="{ on }">
            <v-chip
              class="button"
              color="primary"
              v-on="on"
              @click="$emit('addDatabase')"
            >
              <v-icon dark size="20">mdi-plus</v-icon>
            </v-chip>
          </template>
          <span>Add Database</span>
        </v-tooltip>
      </v-card-title>
    </v-card>
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
<style scoped>
.list {
  z-index: 9;
}
.button {
  margin-right: 10px;
  margin-left: 10px;
}
.header {
  padding: 5px !important;
  margin-left: 10px !important;
  align-content: center;
  justify-content: center;
}
</style>
