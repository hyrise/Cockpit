<template>
  <div id="home">
    <p>
      <v-btn
        x-large
        class="ma-2 py-12"
        tile
        color="primary white--text"
        :to="{ name: 'databases' }"
      >
        <v-icon left>mdi-monitor-cellphone</v-icon> Monitoring
      </v-btn>
      <v-btn
        x-large
        class="ma-2 py-12"
        tile
        color="primary white--text"
        :to="{ name: 'workload' }"
        target="_blank"
      >
        <v-icon left>mdi-database-refresh</v-icon> Workload Generation
      </v-btn>
    </p>
  </div>
</template>
