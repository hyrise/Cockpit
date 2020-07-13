<template>
  <div class="setting-row">
    <v-tooltip class="setting-tooltip" bottom data-id="setting-description">
      <template v-slot:activator="{ on }">
        <v-icon
          class="setting-icon"
          v-on="on"
          data-id="setting-help-icon"
          @click="togglePluginEditor()"
          >mdi-help-circle</v-icon
        >
      </template>
      <span data-id="setting-description">{{ setting.description }}</span>
    </v-tooltip>
    <div class="setting-name" data-id="setting-name">{{ setting.name }}:</div>
    <v-text-field
      class="setting-text"
      v-model="value"
      data-id="setting-value"
    />
    <v-btn
      text
      data-id="setting-save"
      @click="updatePluginSettings(databaseId, pluginId, setting.name, value)"
      >save</v-btn
    >
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref,
} from "@vue/composition-api";

interface Props {
  databaseId: string;
  pluginId: string;
  setting: any;
}

interface Data {
  updatePluginSettings: (
    databaseId: string,
    pluginId: string,
    settingId: string,
    settingValue: string
  ) => void;
  value: string;
}

export default defineComponent({
  name: "PluginSetting",
  props: {
    databaseId: {
      type: String,
      default: "",
    },
    pluginId: {
      type: String,
      default: "",
    },
    setting: {
      type: Object,
      default: null,
    },
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      updatePluginSettings: context.root.$pluginController.changePluginSetting,
      value: props.setting.value,
    };
  },
});
</script>
<style>
.setting-name {
  margin-right: 5px;
  flex: 0 0 40%;
}
.setting-text {
  flex: 0 0 40%;
}
.setting-row {
  margin-left: 2%;
  height: 30px;
  display: flex;
  flex-direction: row;
  align-items: center;
}
.setting-tooltip {
  z-index: 10;
}
.setting-icon {
  margin-right: 4px;
  margin-top: -2px;
}
</style>
