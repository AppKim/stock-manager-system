<template>
  <component :is="layout" />
</template>

<script lang="ts">
import Vue from "vue";
import AfterLogin from "@/layouts/AfterLogin.vue";
import BeforeLogin from "@/layouts/BeforeLogin.vue";

export default Vue.extend({
  name: "Layout",
  components: {
    AfterLogin,
    BeforeLogin,
  },
  computed: {
    // Default layout은 AfterLogin으로!
    layout() {
      return this.$route.meta?.layout || "AfterLogin";
    },
  },
});
</script>

<style></style>
