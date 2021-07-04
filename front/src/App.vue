
<template>
  <div class="flex h-full min-h-[1123px] bg-gray-300">
    <transition name="fade">
      <div v-show="isOpen || curWidth > 940" class="w-60">
        <SideBar @toggleBtnClick="toggleBtnClick" />
      </div>
    </transition>
    <div
      class="flex flex-col flex-1 mx-auto min-w-[1162px] max-w-[1162px]"
      :class="
        isOpen ? 'opacity-30 absolute left:0 top:0 pointer-events-none' : ''
      "
    >
      <div class="h-20">
        <Header @toggleBtnClick="toggleBtnClick" />
      </div>
      <transition name="page">
        <div class="flex-1">
          <div class="bg-white" id="app">
            <div>이부분의 내용이</div>
            <div>주로 바뀌면서 페이지를 이동하는걸로</div>
            <div>하는겁니다</div>
            <img alt="Vue logo" src="./assets/logo.png" />
            <HelloWorld msg="Welcome to Your Vue.js + TypeScript App" />
          </div>
        </div>
      </transition>
      <div class="h-16">
        <Footer />
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import SideBar from "@/components/organisms/SideBar.vue";
import HelloWorld from "./components/HelloWorld.vue";
import Header from "@/components/organisms/Header.vue";
import Footer from "@/components/organisms/Footer.vue";

export default Vue.extend({
  name: "App",
  components: {
    Header,
    Footer,
    HelloWorld,
    SideBar,
  },
  data() {
    return {
      isOpen: false,
      curWidth: window.innerWidth,
    };
  },
  mounted() {
    window.addEventListener("resize", this.handleResize);
  },
  beforeDestroy() {
    window.removeEventListener("resize", this.handleResize);
  },

  methods: {
    handleResize() {
      this.curWidth = window.innerWidth;
    },
    toggleBtnClick() {
      this.isOpen = !this.isOpen;
    },
  },
});
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
.fade-enter-active,
.fade-leave-active {
  transition: margin 0.3s;
}
.fade-enter,
.fade-leave-to {
  margin-left: -230px;
}
.page-enter-active,
.page-leave-active {
  transition: all 0.3s;
}
.page-enter,
.page-leave-to {
  opacity: 0;
  transform: translateX(-100px);
}
</style>
