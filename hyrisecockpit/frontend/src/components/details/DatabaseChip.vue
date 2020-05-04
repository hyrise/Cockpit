<template>
  <div class="database-chip">
    <v-tooltip v-if="closable" left>
      <template v-slot:activator="{ on: remove, value }">
        <v-icon
          id="remove-database-button"
          class="mr-3"
          v-on="remove"
          color="error"
          :size="value ? 36 : 28"
          @click="$emit('closed')"
          >mdi-delete-forever</v-icon
        >
      </template>
      <span>Remove Database</span>
    </v-tooltip>
    <v-chip
      v-if="database"
      id="database-chip"
      class="white--text"
      :color="database.color"
    >
      <div v-if="selectable">
        <v-icon
          v-if="selected"
          id="add-select-database-button"
          left
          @click="handleUnSelect(database.id)"
          >mdi-eye</v-icon
        >
        <v-icon
          v-if="!selected"
          id="remove-select-database-button"
          left
          @click="handleSelect(database.id)"
          >mdi-eye-off</v-icon
        >
      </div>
      <div v-if="!!onlyIcon">
        <v-tooltip bottom>
          <template v-slot:activator="{ on: test }">
            <v-icon v-on="test">mdi-database</v-icon>
          </template>
          <span>{{ database.id }}</span>
        </v-tooltip>
      </div>
      <div v-else>
        <v-icon class="tooltip-icon" v-if="!selectable" top
          >mdi-database</v-icon
        >
        <b>{{ database.id }}</b>
      </div>
    </v-chip>
  </div>
</template>
<script lang="ts">
import {
  defineComponent,
  SetupContext,
  Ref,
  ref,
  computed,
  watch,
} from "@vue/composition-api";
import { Database } from "@/types/database";
import { useSelectableItem } from "@/meta/selection";

interface Data {
  database: Ref<Database>;
  handleSelect: (id: string) => void;
  handleUnSelect: (id: string) => void;
}

interface Props {
  databaseId: string;
  closable: boolean;
  selectable: boolean;
  selected: boolean;
  onlyIcon: boolean;
}

export default defineComponent({
  name: "DatabaseChip",
  props: {
    databaseId: {
      type: String,
      default: null,
    },
    closable: {
      type: Boolean,
      default: false,
    },
    selectable: {
      type: Boolean,
      default: false,
    },
    selected: {
      type: Boolean,
      default: undefined,
    },
    onlyIcon: {
      type: Boolean,
      default: undefined,
    },
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      database: computed(() =>
        context.root.$databaseController.getDatabaseById(props.databaseId)
      ),
      ...useSelectableItem(context),
    };
  },
});
</script>
<style scoped>
.database-chip {
  z-index: 3;
}
</style>
