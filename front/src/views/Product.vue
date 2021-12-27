<template>
  <div>
    <div>
      <ProductSearch
        v-bind:brands="brands"
        :category="category"
        @setInput="setInput"
        @serchSelectbox="serchSelectbox"
      ></ProductSearch>
      <!-- <ProductSearch @setInput="setInput"></ProductSearch> -->
    </div>
    <div class="flex-1 flex">
      <div v-if="isLoading" class="w-full m-auto">
        <Loading />
      </div>
      <ProductList
        v-else
        v-bind:items="items"
        :search="search"
        @editProduct="toggleEditProduct"
        @deleteProduct="deleteProduct"
      ></ProductList>
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
import axios from 'axios'
import Vue from 'vue'
import { axiosPost, axiosGet, axiosPut, axiosDelete } from '@/api/axios.js'
import { set } from 'vue/types/umd'

export default Vue.extend({
  name: 'Product',
  data() {
    return {
      searchItem: [],
      items: [],
      search: [],
      brands: [],
      category: [],
      onUpdate: false,
      updateProductInfo: {},
    }
  },
  async created() {
    await Promise.all([this.getBrand(), this.getCategory(), this.getProduct()])
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
          this.getProduct()
        })
        .catch((error) => {
          console.log(error)
        })
    },
    deleteProduct(pr_id) {
      axiosDelete('api/products', pr_id)
        .then((response) => {
          console.log(response)
          this.getProduct()
        })
        .catch((error) => {
          console.error(error)
        })
    },
    async getBrand() {
      try {
        const result = await axiosGet('api/brands')
        this.brands = result.data.brands
      } catch (e) {
        console.error(e)
      }
    },
    async getCategory() {
      try {
        const result = await axiosGet('api/categories')
        this.category = result.data.categories
      } catch (e) {
        console.error(e)
      }
    },
    async getProduct() {
      this.isLoading = true
      try {
        const result = await axiosGet('api/products')
        this.items = result.data.results
      } catch (e) {
        console.error(e)
      } finally {
        setTimeout(() => {
          this.isLoading = false
        }, 1000)
      }
    },
    setInput(searchItems, searchContent) {
      console.log(searchItems, searchContent)
      axios
        .get('api/products/search', {
          params: {
            searchItems,
            searchContent,
          },
          // axios 파일에 위에 메소드 추가하기
        })
        .then((rs) => {
          this.items = rs.data.results
          console.log(rs)
        })
        .catch((e) => {
          console.log(e)
        })
    },
    // 셀렉트 박스로 조회하기
    serchSelectbox(serchSelectbox) {
      console.log(serchSelectbox)
      axios
        .get('api/products/search', {
          params: {
            // brand:serchSelectbox,
            category: serchSelectbox,
          },
        })
        .then((rs) => {
          this.items = rs.data.results
          console.log(rs)
        })
        .catch((e) => {
          console.log(e)
        })
    },
  },
})
</script>
