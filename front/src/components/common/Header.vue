<template>
  <header class="flex justify-between">
    <div>
      <button
        class="
          flex
          justify-center
          items-center
          w-10
          h-10
          hover:bg-gray-300
          rounded-full
          transition-all
        "
        @click="$emit('toggleBtnClick')"
      >
        =
      </button>
    </div>
    <div class="flex justify-between">
      <router-link to="/login" class="mr-6">Login</router-link>
      <span>logout</span>
    </div>
  </header>
</template>
<script lang="ts">
import Vue from "vue";

export default Vue.extend({
  name: "Header",
});
</script>
