<template>
  <div>
    <div class="setting-row">
      <div class="setting-name">
        {{ setting.name.substring(setting.name.indexOf("_") + 1) }}:
      </div>
      <v-text-field class="setting-text" v-model="value" />
      <v-btn
        text
        @click="updatePluginSettings(databaseId, setting.name, value)"
      >
        save
      </v-btn>
    </div>
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
  value: any;
}

export default defineComponent({
  name: "PluginSettings",
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

    return { updatePluginSettings, value };
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
  margin-left: 5%;
  margin-top: -10px;
  display: flex;
  flex-direction: row;
  align-items: baseline;
}
</style>
