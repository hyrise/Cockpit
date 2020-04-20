import Vue from "vue";
import VueRouter from "vue-router";
import Instance from "../views/Instance.vue";
import InstanceComparison from "../views/InstanceComparison.vue";
import Overview from "../views/Overview.vue";
import Home from "../views/Home.vue";
import WorkloadMonitoring from "../views/WorkloadMonitoring.vue";

Vue.use(VueRouter);

const routes = [
  { name: "home", path: "/", component: Home },
  { name: "database", path: "/database/:id", component: Instance },
  { name: "workload", path: "/workload", component: WorkloadMonitoring },
  {
    name: "comparison",
    path: "/databases/compare",
    component: InstanceComparison,
  },
  {
    name: "overview",
    path: "/databases/overview",
    component: Overview,
  },
];

export default new VueRouter({
  routes,
});
