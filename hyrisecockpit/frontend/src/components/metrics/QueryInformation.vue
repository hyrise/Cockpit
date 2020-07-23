<template>
  <div>
    <metric-details
      v-if="showDetails"
      :metric="metric"
      :databases="selectedDatabases"
      :total-number-of-databases="totalNumberOfDatabases"
    />
    <v-card data-id="query-table">
      <v-card-title>
        <database-chip :database-id="databaseId" />
        <v-spacer />
        <v-text-field
          v-model="searchQueries"
          append-icon="mdi-magnify"
          label="Search queries"
          single-line
          hide-details
          data-id="query-search-input"
        />
      </v-card-title>
      <v-data-table
        :loading="loading"
        :headers="headers"
        :items="displayedQueries"
        :search="searchQueries"
        item-key="queryNumber"
        data-id="query-data-table"
      />
    </v-card>
  </div>
</template>

<script lang="ts">
import { defineComponent, SetupContext } from "@vue/composition-api";
import QueryTable from "@/components/queries/QueryTable.vue";
import {
  MetricProps,
  MetricPropsValidation,
  LineChartComponentData,
} from "@/types/metrics";
import MetricDetails from "@/components/details/MetricDetails.vue";
import { useLineChartComponent } from "@/meta/components";
import { ChartConfiguration } from "../../types/metrics";

export default defineComponent({
  name: "QueryInformation",
  props: MetricPropsValidation,
  components: { QueryTable, MetricDetails },
  setup(props: MetricProps, context: SetupContext): LineChartComponentData {
    return {
      ...useLineChartComponent(props, context),
    };
  },
});
</script>
