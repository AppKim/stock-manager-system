import Vue from 'vue'
import VueRouter, { RouteConfig } from 'vue-router'

Vue.use(VueRouter)

const Home = () => import(/* webpackChunkName: "Home" */ '@/views/index.vue')
const About = () => import(/* webpackChunkName: "About" */ '@/views/About.vue')
const Login = () => import(/* webpackChunkName: "Login" */ '@/views/Login.vue')
const Register = () => import(/* webpackChunkName: "Register" */ '@/views/Register.vue')
const Product = () => import(/* webpackChunkName: "Product" */ '@/views/Product.vue')
const Stock = () => import(/* webpackChunkName: "Stock" */ '@/views/Stock.vue')
const routes: Array<RouteConfig> = [
  {
    path: '/',
    name: 'Home',
    meta: {
      isMenu: true,
      layout: 'AfterLogin',
      requireAuth: true,
      icon: 'fas fa-home fa-fw text-2xl',
    },
    component: Home,
  },
  {
    path: '/about',
    name: 'About',
    meta: {
      isMenu: true,
      layout: 'AfterLogin',
      requireAuth: true,
      icon: 'fas fa-home fa-fw text-2xl',
    },
    component: About,
  },
  {
    path: '/login',
    name: 'Login',
    meta: {
      isMenu: false,
      layout: 'BeforeLogin',
      requireAuth: false,
    },
    component: Login,
  },
  {
    path: '/product',
    name: 'Product',
    meta: {
      isMenu: true,
      layout: 'AfterLogin',
      requireAuth: true,
      icon: '',
    },
    component: Product,
  },
  {
    path: '/stock',
    name: 'Stock',
    meta: {
      isMenu: true,
      layout: 'AfterLogin',
      requireAuth: true,
      icon: '',
    },
    component: Stock,
  },
  {
    path: '/register',
    name: 'Register',
    meta: {
      isMenu: false,
      layout: 'BeforeLogin',
      requireAuth: false,
    },
    component: Register,
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes,
})

export default router
