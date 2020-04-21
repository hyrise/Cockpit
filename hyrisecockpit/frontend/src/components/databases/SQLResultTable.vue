<template>
  <v-simple-table class="result-table" :fixed-header="true">
    <template v-slot:default>
      <thead>
        <tr>
          <th v-for="column in columnNames" :key="column" class="text-left">
            {{ column }}
          </th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(row, idx) in rows" :key="`row_${idx}`">
          <td v-for="value in row" :key="`row_${idx}_${value}`">
            {{ value }}
          </td>
        </tr>
      </tbody>
    </template>
  </v-simple-table>
</template>

<script lang="ts">
import {
  SetupContext,
  defineComponent,
  ref,
  Ref,
  computed,
} from "@vue/composition-api";
import { useDatabaseService } from "../../services/databaseService";

interface Data {}

interface Props {
  columnNames: string[];
  rows: any[];
}

export default defineComponent({
  components: {},
  props: {
    columnNames: {
      type: Array,
      default: null,
    },
    rows: {
      type: Array,
      default: null,
    },
  },
  setup(props: Props, context: SetupContext): Data {
    return {};
  },
});
</script>
<style scoped>
.result-table {
  overflow-x: auto;
  overflow-y: scroll;
  max-height: 300px;
}
</style>
