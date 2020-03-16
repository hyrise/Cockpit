<template>
  <div>
    <slot name="optionalHeader" />
    <v-expansion-panels
      v-if="showPanels"
      v-model="panels"
      multiple
      class="panels white--text"
      :accordion="accordion"
    >
      <v-expansion-panel v-for="content in contentList" :key="content">
        <v-expansion-panel-header class="title" :color="headerColor">
          <slot name="header">{{ content }}</slot>
          <template #actions>
            <v-icon :color="iconColor">$expand</v-icon>
          </template>
        </v-expansion-panel-header>
        <v-expansion-panel-content>
          <slot name="content">
            <database-system-details :selected-databases="[content]" />
          </slot>
        </v-expansion-panel-content>
      </v-expansion-panel>
    </v-expansion-panels>
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
import DatabaseSystemDetails from "./DatabaseSystemDetails.vue";

interface Props {
  contentList: string[];
  accordion: boolean;
  headerColor: string;
  showPanels: boolean;
}
interface Data {
  panels: Ref<number[]>;
  iconColor: Ref<string>;
}

export default defineComponent({
  name: "DatabaseDetailsPanel",
  props: {
    contentList: {
      type: Array,
      default: () => [0]
    },
    accordion: {
      type: Boolean,
      default: false
    },
    headerColor: {
      type: String,
      default: "grey darken-3"
    },
    showPanels: {
      type: Boolean,
      default: true
    }
  },
  components: { DatabaseSystemDetails },
  setup(props: Props, context: SetupContext): Data {
    return {
      panels: ref<number[]>([]),
      iconColor: computed(() =>
        props.headerColor === "grey darken-3" ? "white" : ""
      )
    };
  }
});
</script>
<style>
.panels {
  margin-top: 0.5%;
}
</style>
