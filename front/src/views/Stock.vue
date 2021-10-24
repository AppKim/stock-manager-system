<!--親コンポーネント-->
<template>
  <div class="flex flex-col">
    <div>
      <StockSearch v-on:search-options="search"></StockSearch>
    </div>
    <div class="flex-1 flex">
      <StockList></StockList>
      <StockRegister></StockRegister>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import { SeacrhFn } from "../components/stock/services/stock-service";
import { SearchParams } from "../components/stock/services/stock-interface"

export default Vue.extend({
  name: 'Stock',
  data() {
    return {
      brandNameCondition: [],
      expirationCondition: [],
      brandList: {
        brands: [],
        type: true,
      },
      stockCount: [],
    }
  },
  components: {
    StockList: () => import("../components/stock/list.vue"),
    StockRegister: () => import("../components/stock/register.vue"),
    StockSearch: () => import("../components/stock/search.vue"),
  }, methods: {
      search(param: SearchParams) {
        SeacrhFn(param);
      }
    }
});
</script>
