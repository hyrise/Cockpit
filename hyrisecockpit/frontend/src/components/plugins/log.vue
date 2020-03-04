<template>
  <div id="log">
    <v-card class="card" color="primary">
      <v-card-title>
        Databases
      </v-card-title>
    </v-card>
    <v-textarea
      filled
      name="log"
      label="Filled textarea"
      :value="logText"
      disabled
    ></v-textarea>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref
} from "@vue/composition-api";
import { Database } from "../../types/database";

interface Props {
  logText: string;
}
interface Data {}

export default defineComponent({
  name: "log",
  props: {
    logText: {
      type: String,
      default: ""
    }
  },
  setup(props: Props, context: SetupContext): Data {
    onMounted(() => {});

    return {};
  }
});
</script>
<style>
.sticky {
  position: fixed;
  top: 70px;
  z-index: 10;
  width: 500px;
  right: 0px;
}
</style>
