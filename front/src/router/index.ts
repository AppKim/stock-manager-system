import Vue from "vue";
import VueRouter, { RouteConfig } from "vue-router";

Vue.use(VueRouter);

const routes: Array<RouteConfig> = [
  {
    path: "/",
    name: "Home",
    meta: {
      isMenu: true,
      layout: "AfterLogin",
      requireAuth: true,
      icon: "fas fa-home fa-fw text-2xl",
    },
    component: () => import("@/views/index.vue"),
  },
  {
    path: "/about",
    name: "About",
    meta: {
      isMenu: true,
      layout: "AfterLogin",
      requireAuth: true,
      icon: "fas fa-home fa-fw text-2xl",
    },
    component: () => import("@/views/About.vue"),
  },
  {
    path: "/login",
    name: "Login",
    meta: {
      isMenu: false,
      layout: "BeforeLogin",
      requireAuth: false,
    },
    component: () => import("@/views/Login.vue"),
  },
  {
    path: "/product",
    name: "Product",
    meta: {
      isMenu: true,
      layout: "AfterLogin",
      requireAuth: true,
      icon: "",
    },
    component: () => import("@/views/Product.vue"),
  },
  {
    path: "/register",
    name: "Register",
    meta: {
      isMenu: false,
      layout: "BeforeLogin",
      requireAuth: false,
    },
    component: () => import("@/views/Register.vue"),
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
