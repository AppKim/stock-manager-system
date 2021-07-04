<template>
  <aside
    class="
      flex
      fixed
      top-0
      z-10
      flex-col
      w-60
      min-h-1123
      text-xs
      font-normal
      bg-gray-200
    "
  >
    <!-- Title -->
    <div class="flex relative pc:flex-col justify-center items-center h-20">
      <div>Company Name</div>
      <button
        class="absolute top-4 right-4 text-white"
        @click="$emit('toggleBtnClick')"
      >
        X
      </button>
    </div>
    <!-- User Profile -->
    <div class="flex flex-col justify-center items-center h-36 bg-gray-700">
      <img class="rounded-full" src=" http://picsum.photos/60" />
      <p class="mt-2 text-xs font-normal text-white">hee won</p>
    </div>

    <!-- Navigation -->
    <nav class="pt-3">
      <div v-for="page in pages" :key="page.id">
        <div class="h-20 text-black flex items-center justify-center text-lg">
          {{ page.name }}
        </div>
      </div>
    </nav>
  </aside>
</template>
<script lang="ts">
import Vue from "vue";

export default Vue.extend({
  name: "SideBar",

  data() {
    return {
      pages: [
        {
          name: "제품목록",
          id: 1,
        },
        {
          name: "입고/출고",
          id: 2,
        },
        {
          name: "히스토리",
          id: 3,
        },
        {
          name: "대시보드",
          id: 4,
        },
        {
          name: "설정",
          id: 5,
        },
        {
          name: "마이페이지",
          id: 6,
        },
        {
          name: "문의",
          id: 7,
        },
      ],
    };
  },
});
</script>
