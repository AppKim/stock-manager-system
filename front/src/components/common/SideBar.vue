<template>
  <aside class="flex fixed top-0 z-10 flex-col w-60 min-h-[1123px] text-xs font-normal bg-gray-200">
    <!-- Title -->
    <div class="flex flex-col relative justify-center items-center h-20">
      <div class="text-lg">Stock Manager</div>
      <button class="absolute top-4 right-4 text-black" @click="$emit('toggleBtnClick')">X</button>
    </div>
    <!-- User Profile -->
    <div class="flex flex-col justify-center items-center h-36 bg-gray-700">
      <img class="rounded-full" src=" http://picsum.photos/60" />
      <p class="mt-2 text-xs font-normal text-white">hee won</p>
    </div>

    <!-- Navigation -->
    <nav class="pt-3">
      <div v-for="page in pages" :key="page.id">
        <router-link :to="page.path" v-if="page.meta.isMenu">
          <div class="h-20 text-black flex items-center justify-center text-lg">
            {{ page.name }}
          </div>
        </router-link>
      </div>
    </nav>
  </aside>
</template>
<script lang="ts">
import Vue from "vue"
import { RouteConfig } from "vue-router"

export default Vue.extend({
  name: "SideBar",
  created() {
    this.pages = this.$router.options.routes as RouteConfig[]
  },
  data() {
    return {
      pages: [] as RouteConfig[],
    }
  },
})
</script>
