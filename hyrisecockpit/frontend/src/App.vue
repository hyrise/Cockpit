<template>
  <v-app :style="{ background: $vuetify.theme.themes['light'].background }">
    <v-app-bar app color="primary" dark>
      <b> Hyrise Cockpit </b>
    </v-app-bar>
    <v-content>
      <router-view />
    </v-content>
  </v-app>
</template>
