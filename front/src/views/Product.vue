<template>
  <div class="flex flex-col">
    <div>
      <ProductSearch></ProductSearch>
    </div>
    <div class="flex-1 flex">
      <ProductList @toggleEditProduct="toggleEditProduct"></ProductList>
      <ProductEdit
        :brands="brands"
        :is-edit="isEdit"
        :edit-product-info="editProductInfo"
        @createProduct="createProduct"
        @updateProduct="updateProduct"
      ></ProductEdit>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { axiosPost, axiosGet, axiosPut } from '@/api/axios.js'

export default Vue.extend({
  name: 'Product',
  data() {
    return {
      brands: [],
      isEdit: false,
      editProductInfo: {},
    }
  },
  mounted() {
    this.getBrand()
  },
  components: {
    ProductList: () => import('@/components/product/list.vue'),
    ProductEdit: () => import('@/components/product/edit.vue'),
    ProductSearch: () => import('@/components/product/search.vue'),
  },
  methods: {
    toggleEditProduct(item) {
      this.isEdit = true
      this.editProductInfo = item
    },
    createProduct(formData) {
      axiosPost('/api/products', formData)
        .then((rs) => {
          console.log(rs)
        })
        .catch((e) => {
          console.log(e)
        })
    },
    updateProduct(formData) {
      axiosPut('api/products', this.editProductInfo.pr_id, formData)
        .then((response) => {
          console.log(response)
        })
        .catch((error) => {
          console.log(error)
        })
    },

    getBrand() {
      axiosGet('api/brands')
        .then((rs) => {
          this.brands = rs.data.brands
        })
        .catch((e) => {
          console.log(e)
        })
    },
  },
})
</script>
