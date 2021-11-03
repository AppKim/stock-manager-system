<template>
  <component :is="layout" />
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'Layout',
  components: {
    AfterLogin: () => import('@/layouts/AfterLogin.vue'),
    BeforeLogin: () => import('@/layouts/BeforeLogin.vue'),
  },
  computed: {
    // Default layout은 AfterLogin으로!
    layout() {
      return this.$route.meta?.layout || 'AfterLogin'
    },
  },
})
</script>

<style></style>
