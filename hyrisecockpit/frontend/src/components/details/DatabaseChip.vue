<template>
  <v-chip :color="database.color" class="white--text">
    {{ database.id }}
  </v-chip>
</template>
<script lang="ts">
import { defineComponent, SetupContext, Ref, ref } from "@vue/composition-api";
import { Database } from "@/types/database";

interface Data {
  database: Database;
}

interface Props {
  databaseId: string;
}

export default defineComponent({
  name: "DatabaseChip",
  props: {
    databaseId: {
      type: String,
      default: null
    }
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      database: context.root.$databaseController.getDatabaseById(
        props.databaseId
      )
    };
  }
});
</script>
<style scoped></style>
