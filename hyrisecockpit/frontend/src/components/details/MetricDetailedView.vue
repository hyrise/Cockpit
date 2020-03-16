<template>
  <div class="mx-10 my-10">
    <v-dialog v-model="showDialog" hide-overlay>
      <template v-slot:activator="{ on }">
        <v-btn color="secondary" small right dark v-on="on">
          <v-icon left>mdi-arrow-expand</v-icon> Open detailed view
        </v-btn>
      </template>
      <v-card>
        <v-card-title class="metric-title">
          <slot name="header" />
        </v-card-title>
        <v-spacer />
        <v-card-text>
          <slot name="content" />
        </v-card-text>
        <v-card-actions>
          <v-btn block color="grey darken-3" @click="showDialog = false">
            Close detailed view
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  watch,
  Ref,
  ref,
  onMounted
} from "@vue/composition-api";

interface Data {
  showDialog: Ref<boolean>;
}

export default defineComponent({
  name: "MetricDetailedView",
  setup(props: {}, context: SetupContext): Data {
    return {
      showDialog: ref(false)
    };
  }
});
</script>
<style scoped>
.metric-title {
  justify-content: center;
}
</style>
