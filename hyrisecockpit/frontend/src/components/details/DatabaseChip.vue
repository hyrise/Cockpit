<template>
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
        @click="handleUnSelect()"
        >mdi-eye</v-icon
      >
      <v-icon
        v-if="!selected"
        id="remove-select-database-button"
        left
        @click="handleSelect()"
        >mdi-eye-off</v-icon
      >
    </div>
    <v-icon v-if="!selectable" left>mdi-database</v-icon>
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
  computed,
  watch
} from "@vue/composition-api";
import { Database } from "@/types/database";

interface Data {
  database: Ref<Database>;
  handleSelect: () => void;
  handleUnSelect: () => void;
}

interface Props {
  databaseId: string;
  closable: boolean;
  selectable: boolean;
  selected: boolean;
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
    },
    selectable: {
      type: Boolean,
      default: false
    },
    selected: {
      type: Boolean,
      default: undefined
    }
  },
  setup(props: Props, context: SetupContext): Data {
    watch(
      () => props.selected,
      () => {
        console.log(props.selected);
      }
    );

    function handleUnSelect(): void {
      context.emit("toggleSelected", props.databaseId, false);
    }
    function handleSelect(): void {
      context.emit("toggleSelected", props.databaseId, true);
    }
    return {
      database: computed(() =>
        context.root.$databaseController.getDatabaseById(props.databaseId)
      ),
      handleSelect,
      handleUnSelect
    };
  }
});
</script>
<style scoped></style>
