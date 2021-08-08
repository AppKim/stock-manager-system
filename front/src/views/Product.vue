<template>
  <div>
    <div>
      <ProductSearch></ProductSearch>
    </div>
    <div class="flex h-full">
      <ProductList></ProductList>
      <ProductRegister></ProductRegister>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from "vue";

export default Vue.extend({
  name: "Product",
  components: {
    ProductList: () => import("@/components/product/list.vue"),
    ProductRegister: () => import("@/components/product/register.vue"),
    ProductSearch: () => import("@/components/product/search.vue"),
  },
});
</script>
