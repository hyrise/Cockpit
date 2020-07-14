<template>
  <div>
    <v-chip
      v-if="database"
      id="database-chip"
      class="white--text"
      :color="database.color"
    >
      <v-tooltip v-if="closable" left>
        <template v-slot:activator="{ on, value }">
          <v-icon
            id="remove-database-button"
            class="mr-3"
            v-on="on"
            color="secondary"
            :size="value ? 25 : 20"
            @click="$emit('closed')"
            >mdi-close-circle</v-icon
          >
        </template>
        <span>Remove Database</span>
      </v-tooltip>
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

      <v-tooltip right>
        <template v-slot:activator="{ on }">
          <div v-on="on">
            <v-icon v-if="!selectable" :left="!onlyIcon">mdi-database</v-icon>
            <b v-if="!onlyIcon">{{
              selectable ? truncateItemTitle(database.id) : database.id
            }}</b>
          </div>
        </template>
        <span>{{ database.id }}</span>
      </v-tooltip>
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
import { useSelectableItem, UseSelectableItem } from "@/meta/selection";

interface Data extends UseSelectableItem {
  database: Ref<Database>;
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
<style scoped></style>
