<template>
  <v-chip :color="database.color" class="white--text">
    {{ database.id }}
  </v-chip>
</template>
<script lang="ts">
import { defineComponent, SetupContext, Ref, ref } from "@vue/composition-api";
import { Database } from "../../types/database";

interface Data {}

interface Props {
  database: Database;
}

export default defineComponent({
  name: "DatabaseChip",
  props: {
    database: {
      type: String,
      default: null
    }
  },
  setup(props: Props, context: SetupContext): Data {
    return {};
  }
});
</script>
<style scoped></style>
