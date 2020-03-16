<template>
  <v-navigation-drawer v-model="open" app class="elevation-2" width="100">
    <v-toolbar color="primary darken-1"> </v-toolbar>
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
