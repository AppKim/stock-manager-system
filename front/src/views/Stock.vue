<template>
  <div>
    <div>
      <StockSearch></StockSearch>
    </div>
    <div class="flex h-full">
      <StockList></StockList>
      <StockRegister></StockRegister>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from "vue";

export default Vue.extend({
  name: "Stock",
  components: {
    StockList: () => import("@/components/stock/list.vue"),
    StockRegister: () => import("@/components/stock/register.vue"),
    StockSearch: () => import("@/components/stock/search.vue"),
  },
});
</script>
