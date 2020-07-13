<template>
  <v-dialog v-model="open" persistent max-width="400px">
    <v-card data-id="remove-database">
      <v-card-title>
        <span class="headline">Remove database</span>
      </v-card-title>
      <v-card-text>
        <div>Do you really want to remove this database?</div>
        <database-chip class="mt-4" :database-id="databaseId" />
      </v-card-text>
      <v-card-actions>
        <v-spacer />
        <v-btn
          color="primary"
          text
          data-id="cancel-remove-database-button"
          @click="$emit('close')"
          >Cancel</v-btn
        >
        <v-btn
          color="primary"
          text
          data-id="delete-database-button"
          @click="onRemoveDatabase()"
          >Remove</v-btn
        >
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref,
  watch,
} from "@vue/composition-api";
import { useDatabaseService } from "@/services/databaseService";
import DatabaseChip from "@/components/details/DatabaseChip.vue";

interface Props {
  open: boolean;
  databaseId: string;
}
interface Data {
  onRemoveDatabase: () => void;
}

export default defineComponent({
  props: {
    open: {
      type: Boolean,
      default: null,
    },
    databaseId: {
      type: String,
      default: null,
    },
  },
  components: {
    DatabaseChip,
  },
  setup(props: Props, context: SetupContext): Data {
    const databaseService = useDatabaseService();

    function onRemoveDatabase(): void {
      context.emit("close");
      databaseService.removeDatabase(props.databaseId);
    }
    return { onRemoveDatabase };
  },
});
</script>
<style scoped></style>
