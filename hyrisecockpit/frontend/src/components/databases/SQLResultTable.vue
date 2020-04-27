<template>
  <div>
    Result:
    <v-simple-table
      class="result-table"
      :fixed-header="true"
      :height="Math.min(rows.length * 100, 400)"
    >
      <template v-slot:default>
        <thead>
          <tr>
            <th v-for="column in columnNames" :key="column" class="text-left">
              {{ column }}
            </th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(row, rowIdx) in rows" :key="`row_${rowIdx}`">
            <td
              v-for="(value, valueIdx) in row"
              :key="`row_${rowIdx}_value_${valueIdx}`"
            >
              {{ value }}
            </td>
          </tr>
        </tbody>
      </template>
    </v-simple-table>
  </div>
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
  overflow: auto;
  max-height: 100%;
}
</style>
