<template>
  <v-chip
    v-if="database"
    id="database-chip"
    class="white--text"
    :color="database.color"
  >
    <v-icon left>mdi-database</v-icon>
    <b>{{ database.id }}</b>
    <v-tooltip v-if="closable" right>
      <template v-slot:activator="{ on }">
        <v-icon
          id="remove-database-button"
          v-on="on"
          right
          @click="$emit('closed')"
          >mdi-close-circle</v-icon
        >
      </template>
      <span>Remove Database</span>
    </v-tooltip>
  </v-chip>
</template>
<script lang="ts">
import {
  defineComponent,
  SetupContext,
  Ref,
  ref,
  computed
} from "@vue/composition-api";
import { Database } from "@/types/database";

interface Data {
  database: Ref<Database>;
}

interface Props {
  databaseId: string;
  closable: boolean;
}

export default defineComponent({
  name: "DatabaseChip",
  props: {
    databaseId: {
      type: String,
      default: null
    },
    closable: {
      type: Boolean,
      default: false
    }
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      database: computed(() =>
        context.root.$databaseController.getDatabaseById(props.databaseId)
      )
    };
  }
});
</script>
<style scoped></style>
