import { ref } from "@vue/composition-api";
import axios from "axios";
import { monitorBackend } from "../../config";

export function usePluginService(): any {
  const plugins = ref<string[]>([]);
  const activePlugins = ref<string[]>([]);

  getPlugins();

  function getPlugins(): void {
    axios.get(monitorBackend + "throughput").then(response => {
      console.log(response);
    });
    plugins.value = ["auto-index", "ki-stuff", "no-more-problems"];
  }

  function updatePlugins(activePlugins: any): void {
    console.log(activePlugins);
    axios.get(monitorBackend + "throughput").then(response => {
      activePlugins.value = activePlugins;
    });
  }

  return {
    plugins,
    activePlugins,
    updatePlugins
  };
}
