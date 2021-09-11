<template>
  <div>
    <div>
      <ProductSearch></ProductSearch>
    </div>
    <div class="flex flex-1 h-full">
      <ProductList @toggleEditProduct="toggleEditProduct"></ProductList>
      <ProductRegister :is-edit="isEdit" :edit-product-id="editProductId"></ProductRegister>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from "vue"

export default Vue.extend({
  name: "Product",
  data() {
    return {
      isEdit: false,
      editProductId: "",
    }
  },
  components: {
    ProductList: () => import("@/components/product/list.vue"),
    ProductRegister: () => import("@/components/product/register.vue"),
    ProductSearch: () => import("@/components/product/search.vue"),
  },
  methods: {
    toggleEditProduct(pr_id: string) {
      this.isEdit = true
      this.editProductId = pr_id
    },
  },
})
</script>
