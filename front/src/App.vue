<template>
  <Layout />
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  components: { Layout: () => import('@/layouts/Layout.vue') },
})
</script>

<style></style>
