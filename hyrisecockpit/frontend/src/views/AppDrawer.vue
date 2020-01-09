<template>
  <v-navigation-drawer v-model="open" app class="elevation-2" fixed width="300">
    <v-toolbar color="primary darken-1"> </v-toolbar>
    <v-list class="mt-2">
      <v-subheader>SCREENS</v-subheader>
      <v-list-item-group>
        <v-list-item :to="{ name: 'home' }">
          <v-list-item-action>
            <v-icon>
              mdi-home-outline
            </v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>
              Home
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item :to="{ name: 'databases' }">
          <v-list-item-action>
            <v-icon>
              mdi-database
            </v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>
              Databases Overview
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item :to="{ name: 'workload' }" target="_blank">
          <v-list-item-action>
            <v-icon>
              mdi-database-refresh
            </v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>
              Workload Generation
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list-item-group>
    </v-list>
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
