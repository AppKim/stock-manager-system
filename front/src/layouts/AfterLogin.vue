<template>
  <div class="flex h-full min-h-[1123px] bg-gray-300">
    <transition name="fade">
      <div v-show="isOpen" class="w-60">
        <SideBar @toggleBtnClick="toggleBtnClick" />
      </div>
    </transition>
    <div
      class="flex-1 flex flex-col mx-auto min-w-[1162px] max-w-[1162px]"
      :class="isOpen && curWidth < 1400 ? 'opacity-30 pointer-events-none' : ''"
    >
      <div class="h-20">
        <Header @toggleBtnClick="toggleBtnClick" />
      </div>
      <div class="flex-1 flex">
        <router-view class="flex-1" />
      </div>
      <div class="h-16">
        <Footer />
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import SideBar from '@/components/common/SideBar.vue'
import Header from '@/components/common/Header.vue'
import Footer from '@/components/common/Footer.vue'

export default Vue.extend({
  name: 'AfterLogin',
  components: {
    Header,
    Footer,
    SideBar,
  },
  data() {
    return {
      isOpen: window.innerWidth < 1400 ? false : true,
      curWidth: window.innerWidth,
    }
  },
  watch: {
    $route() {
      this.isOpen = window.innerWidth < 1400 ? false : true
    },
  },
  mounted() {
    window.addEventListener('resize', this.handleResize)
  },
  beforeDestroy() {
    window.removeEventListener('resize', this.handleResize)
  },

  methods: {
    handleResize() {
      this.curWidth = window.innerWidth
      if (window.innerWidth < 1400) {
        this.isOpen = false
      } else {
        this.isOpen = true
      }
    },
    toggleBtnClick() {
      this.isOpen = !this.isOpen
    },
  },
})
</script>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: margin 0.3s;
}
.fade-enter,
.fade-leave-to {
  margin-left: -230px;
}
/* .page-enter-active,
.page-leave-active {
  transition: all 0.15s;
}
.page-enter,
.page-leave-to {
  opacity: 0;
  transform: translate(-100%);
} */
</style>
