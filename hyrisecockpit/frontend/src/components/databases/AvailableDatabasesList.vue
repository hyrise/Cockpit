<template>
  <v-card class="list" data-id="database-list" width="280px">
    <v-system-bar :height="50" color="secondary">
      <v-card-title>
        <div class="header">Databases</div>
      </v-card-title>
      <v-spacer></v-spacer>
      <v-icon @click="onClose()">mdi-close</v-icon>
    </v-system-bar>

    <v-container class="white container flex">
      <v-btn @click="$emit('addDatabase')" small elevation="3" class="add mt-1">
        <v-text class="text font-weight-regular mr-1">Add</v-text>
        <v-icon :size="20">mdi-database-plus</v-icon>
      </v-btn>
      <v-row no gutters>
        <v-col class="flex-item">
          <v-list class="mt-1" v-for="database in databases" :key="database.id">
            <v-list-item-title class="database-list-item">
              <database-chip
                :database-id="database.id"
                :closable="true"
                @closed="$emit('removeDatabase', database)"
              />
              <v-spacer></v-spacer>
              <s-q-l-editor :databaseId="database.id" />
            </v-list-item-title>
          </v-list>
        </v-col>
      </v-row>
    </v-container>
  </v-card>
</template>

<script lang="ts">
import {
  SetupContext,
  defineComponent,
  ref,
  Ref,
  computed,
} from "@vue/composition-api";
import { Database } from "@/types/database";
import DatabaseChip from "@/components/details/DatabaseChip.vue";
import SQLEditor from "@/components/databases/SQLEditor.vue";

interface Data {
  databases: Ref<readonly Database[]>;
}

export default defineComponent({
  components: {
    DatabaseChip,
    SQLEditor,
  },
  setup(props: {}, context: SetupContext): Data {
    const {
      getDatabasesByIds,
      availableDatabasesById,
    } = context.root.$databaseController;

    return {
      databases: computed(() =>
        getDatabasesByIds(availableDatabasesById.value as string[])
      ),
    };
  },
});
</script>
<style scoped>
.list {
  z-index: 12;
}
.database-list-item {
  display: flex;
}
.header {
  display: block;
  margin-left: auto !important;
  margin-right: auto !important;
  font-size: medium;
}
</style>
