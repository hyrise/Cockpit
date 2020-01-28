<template>
  <v-navigation-drawer v-model="open" app class="elevation-2" width="150">
    <v-toolbar color="primary darken-1"> </v-toolbar>
    <v-card class="text-center" :to="{ name: 'database' }">
      <v-icon size="150">
        mdi-database-search
      </v-icon>
      <v-card-title class="justify-center">
        Instanz
      </v-card-title>
    </v-card>
    <v-card class="text-center" :to="{ name: 'comparison' }">
      <v-icon class="mt-2" size="100">
        mdi-speedometer
      </v-icon>
      <v-card-title class="justify-center">
        Vergleich
      </v-card-title>
    </v-card>
    <v-card class="text-center" :to="{ name: 'workload' }">
      <v-icon class="mt-2" size="100">
        mdi-worker
      </v-icon>
      <v-card-title class="justify-center">
        Workload
      </v-card-title>
    </v-card>
    <v-card class="text-center" :to="{ name: 'home' }">
      <v-icon class="mt-2" size="100">
        mdi-settings
      </v-icon>
      <v-card-title class="justify-center">
        Plugins
      </v-card-title>
    </v-card>
  </v-navigation-drawer>
</template>

<script lang="ts">
import { SetupContext, createComponent } from "@vue/composition-api";

interface Props {
  open: boolean;
}

export default createComponent({
  props: {
    open: {
      type: Boolean,
      default: false
    }
  }
});
</script>
