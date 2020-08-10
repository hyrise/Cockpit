<template>
  <v-row class="mt-2 ml-n3" no-gutters align="center" justify="center">
    <v-col class="text-center">
      <slot name="first">
        <br />
      </slot>
    </v-col>
    <v-col class="text-center">
      <slot name="second">
        <br />
      </slot>
    </v-col>
    <v-col class="text-center">
      <slot name="third">
        <br />
      </slot>
    </v-col>
  </v-row>
</template>
´

<script lang="ts">
import { defineComponent } from "@vue/composition-api";

export default defineComponent({});
</script>
