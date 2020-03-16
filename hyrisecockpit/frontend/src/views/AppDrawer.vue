<template>
  <v-navigation-drawer v-model="open" app class="elevation-2" width="200">
    <v-toolbar color="grey darken-3" class="text-center">
      <v-img
        src="../../src/components/images/hpi_logo_transparent.png"
        max-width="40"
        max-height="40"
      >
      </v-img>
    </v-toolbar>
    <v-card class="text-center" :to="{ name: 'overview' }">
      <v-icon class="mt-2" size="70">
        mdi-speedometer
      </v-icon>
      <v-card-title class="justify-center card-title">
        Overview
      </v-card-title>
    </v-card>
    <v-card class="text-center" :to="{ name: 'comparison' }">
      <v-icon class="mt-2" size="70">
        mdi-database-search
      </v-icon>
      <v-card-title class="justify-center card-title">
        Comparison
      </v-card-title>
    </v-card>
    <v-card class="text-center" :to="{ name: 'workload' }">
      <v-icon class="mt-2" size="70">
        mdi-account-hard-hat
      </v-icon>
      <v-card-title class="justify-center card-title">
        Workload
      </v-card-title>
    </v-card>
  </v-navigation-drawer>
</template>

<script lang="ts">
import { SetupContext, defineComponent } from "@vue/composition-api";

interface Props {
  open: boolean;
}

export default defineComponent({
  props: {
    open: {
      type: Boolean,
      default: true
    }
  }
});
</script>
<style scoped>
.card-title {
  padding: 16px 0px 16px 0px;
  font-size: 16px;
}
</style>
