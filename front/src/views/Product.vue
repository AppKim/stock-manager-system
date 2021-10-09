<template>
  <div>
    <div>
      <ProductSearch @setInput='setInput'></ProductSearch>
    </div>
    <div class="flex h-full">
      <ProductList :items='items'></ProductList>
      <ProductRegister></ProductRegister>

    </div>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import { axiosGet } from "@/api/axios.js";

export default Vue.extend({
  name: "Product",
  data() {
    return {
      searchItem: [],
      items: [],
    }
  },
  created() {
    this.getProduct()
  },
  components: {
    ProductList: () => import("@/components/product/list.vue"),
    ProductRegister: () => import("@/components/product/register.vue"),
    ProductSearch: () => import("@/components/product/search.vue"),
  },
  methods: {
    setInput(value) {
      this.searchItem = value;
      console.log(value);
      axiosGet("api/products", this.searchItem) 
        .then((rs) => {
            console.log(rs);
        })
       .catch((e) => {
          console.log(e);
        });
    },
    getProduct() {
      axiosGet("api/products")
        .then((rs) => {
         this.items = rs.data.results;
          console.log(rs);
        })
        .catch((e) => {
          console.log(e);
        });
    }
  }
});
</script>
