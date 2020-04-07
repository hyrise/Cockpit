<template>
  <div>
    <slot name="optionalHeader" />
    <v-expansion-panels
      v-model="showContent"
      class="panels white--text"
      :accordion="accordion"
    >
      <v-expansion-panel>
        <v-expansion-panel-header class="title" :color="headerColor">
          <slot name="header"></slot>
          <template #actions>
            <v-icon :color="iconColor">$expand</v-icon>
          </template>
        </v-expansion-panel-header>
        <v-expansion-panel-content>
          <slot name="content"> </slot>
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

interface Props {
  accordion: boolean;
  headerColor: string;
  showPanel: boolean;
}
interface Data {
  showContent: Ref<0 | undefined>;
  iconColor: Ref<string>;
}

export default defineComponent({
  name: "PanelTemplate",
  props: {
    accordion: {
      type: Boolean,
      default: false
    },
    headerColor: {
      type: String,
      default: "primary"
    },
    showPanel: {
      type: Boolean,
      default: true
    }
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      iconColor: computed(() =>
        props.headerColor === "primary" ? "white" : ""
      ),
      showContent: computed({
        get: () => {
          if (props.showPanel) return 0;
          return;
        },
        set: val => {
          return val;
        }
      })
    };
  }
});
</script>
<style>
.panels {
  margin-top: 0.5%;
}
</style>
