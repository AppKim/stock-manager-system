<template>
  <div>
    <div>
      <ProductSearch @setInput='setInput' @setCategory='setCategory'></ProductSearch>
    </div>
    <div class="flex h-full">
      <ProductList v-bind:items='items' :search='search'></ProductList>
      <ProductRegister></ProductRegister>

    </div>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import { axiosGet } from "@/api/axios.js";
import axios from 'axios'

export default Vue.extend({
  name: "Product",
  data() {
    return {
      searchItem: [],
      items: [],
      search: [],
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
    setInput(searchItems, searchContent) {
      console.log(searchItems, searchContent);
      axios.get("api/products/search", {
        params:{
          searchItems,
          searchContent
        }
        // axios 파일에 위에 메소드 추가하기 
      }).then((rs) => {
          this.items = rs.data.results;
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
