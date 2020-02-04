import Vue from "vue";
import VueRouter from "vue-router";
import Instance from "../screens/Instance.vue";
import InstanceComparison from "../screens/InstanceComparison.vue";
import Overview from "../screens/Overview.vue";
import Selection from "../screens/Selection.vue";
import Home from "../screens/Home.vue";
import WorkloadScreen from "../screens/WorkloadScreen.vue";

Vue.use(VueRouter);

const routes = [
  { name: "home", path: "/", component: Home },
  { name: "database", path: "/database/:id", component: Instance },
  { name: "workload", path: "/workload", component: WorkloadScreen },
  { name: "databases", path: "/databases", component: Selection },
  {
    name: "comparison",
    path: "/databases/compare",
    component: InstanceComparison
  },
  {
    name: "overview",
    path: "/databases/overview",
    component: Overview
  }
];

export default new VueRouter({
  routes
});
