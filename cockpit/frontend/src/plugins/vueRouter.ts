import Vue from "vue";
import VueRouter from "vue-router";
import DatabaseScreen from "../screens/DatabaseScreen.vue";
import Home from "../screens/Home.vue";

Vue.use(VueRouter);

const routes = [
  { name: "home", path: "/", component: Home },
  { name: "database", path: "/database", component: DatabaseScreen }
];

export default new VueRouter({
  routes
});
