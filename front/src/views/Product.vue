<template>
  <div>
    <div>
      <ProductSearch></ProductSearch>
    </div>
    <div class="flex flex-1 h-full">
      <ProductList @toggleEditProduct="toggleEditProduct"></ProductList>
      <ProductRegister :is-edit="isEdit" :edit-product-info="editProductInfo"></ProductRegister>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'Product',
  data() {
    return {
      isEdit: false,
      editProductInfo: {},
    }
  },
  components: {
    ProductList: () => import('@/components/product/list.vue'),
    ProductRegister: () => import('@/components/product/register.vue'),
    ProductSearch: () => import('@/components/product/search.vue'),
  },
  methods: {
    toggleEditProduct(item) {
      this.isEdit = true
      this.editProductInfo = item
    },
  },
})
</script>
