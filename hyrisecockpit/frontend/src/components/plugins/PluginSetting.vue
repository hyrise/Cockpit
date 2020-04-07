<template>
  <div class="setting-row">
    <v-tooltip id="setting-description" class="setting-tooltip" bottom>
      <template v-slot:activator="{ on }">
        <v-icon
          id="setting-help-icon"
          class="setting-icon"
          v-on="on"
          @click="togglePluginEditor()"
        >
          mdi-help-circle
        </v-icon>
      </template>
      <span id="setting-description">{{ setting.description }}</span>
    </v-tooltip>
    <div id="setting-name" class="setting-name">{{ pluginName }}:</div>
    <v-text-field id="setting-value" class="setting-text" v-model="value" />
    <v-btn
      id="setting-save"
      text
      @click="updatePluginSettings(databaseId, setting.name, value)"
    >
      save
    </v-btn>
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
  databaseId: string;
  pluginId: string;
  setting: any;
}

interface Data {
  updatePluginSettings: (
    databaseId: string,
    settingId: string,
    settingValue: string
  ) => void;
  value: string;
  pluginName: string;
}

export default defineComponent({
  name: "PluginSetting",
  props: {
    databaseId: {
      type: String,
      default: ""
    },
    pluginId: {
      type: String,
      default: ""
    },
    setting: {
      type: Object,
      default: null
    }
  },
  setup(props: Props, context: SetupContext): Data {
    const { updatePluginSettings } = context.root.$pluginService;
    let value = props.setting.value;
    const pluginName = props.setting.name.substring(
      props.setting.name.indexOf("_") + 1
    );

    return { updatePluginSettings, value, pluginName };
  }
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
