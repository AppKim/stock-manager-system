<template>
  <div class="flex flex-col">
    <div>
      <ProductSearch></ProductSearch>
    </div>
    <div class="flex-1 flex">
      <ProductList @toggleEditProduct="toggleEditProduct"></ProductList>
      <ProductEdit
        :brands="brands"
        :on-update="onUpdate"
        :update-product-info="updateProductInfo"
        @createProduct="createProduct"
        @updateProduct="updateProduct"
        @convertToCreate="toggleEditProduct"
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
      onUpdate: false,
      updateProductInfo: {},
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
    /**
     * @param item 편집할 아이템정보
     */
    toggleEditProduct(item) {
      if (item) {
        this.updateProductInfo = item
        this.onUpdate = true
      } else {
        this.onUpdate = false
      }
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
      axiosPut('api/products', this.updateProductInfo.pr_id, formData)
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
