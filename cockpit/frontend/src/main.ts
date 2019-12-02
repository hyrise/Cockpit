import Vue from "vue";
import VueCompositionApi from "@vue/composition-api";
import vuetify from "./plugins/vuetify";
import vueRouter from "./plugins/vueRouter";
import App from "./App.vue";

Vue.config.productionTip = false;

Vue.use(VueCompositionApi);
new Vue({
  vuetify,
  router: vueRouter,
  render: h => h(App)
}).$mount("#app");
