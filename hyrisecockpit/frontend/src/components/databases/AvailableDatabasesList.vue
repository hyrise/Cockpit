<template>
  <v-list id="database-list" class="list">
    <v-card flat>
      <v-card-title class="header subtitle-1">
        DATABASES
        <v-spacer />
        <v-tooltip right>
          <template v-slot:activator="{ on }">
            <v-chip
              id="add-database-button"
              class="button"
              color="white primary--text"
              v-on="on"
              @click="$emit('addDatabase')"
            >
              <v-icon color="primary" size="26">mdi-plus</v-icon>
            </v-chip>
          </template>
          <span>Add Database</span>
        </v-tooltip>
      </v-card-title>
    </v-card>
    <v-divider class="my-2" />
    <v-list-item class="mt-1" v-for="database in databases" :key="database.id">
      <v-list-item-title>
        <database-chip
          :database-id="database.id"
          :closable="true"
          @closed="$emit('removeDatabase', database)"
        />
      </v-list-item-title>
    </v-list-item>
  </v-list>
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

interface Data {
  databases: Ref<readonly Database[]>;
}

export default defineComponent({
  components: {
    DatabaseChip,
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
