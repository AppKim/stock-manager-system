<template>
  <div class="w-full h-full bg-white ml-5">
    <h2 class="text-lg font-bold bg-tableColor-bg p-1.5">{{ title }}</h2>
    <section class="flex flex-col space-y-2 p-2">
      <div class="flex items-center">
        <label class="w-[60px]" name="productName">상품명</label>
        <input
          class="p-2 rounded focus:ring-gray-300 focus:outline-none bg-white bg-clip-padding border border-gray-500"
          type="text"
          name="productName"
          v-model="productName"
        />
      </div>
      <div class="flex items-center">
        <label class="w-[60px]" name="productPrice">가격</label>
        <input
          class="p-2 rounded focus:ring-gray-300 focus:outline-none bg-white bg-clip-padding border border-gray-500"
          type="text"
          name="productPrice"
          v-model="productPrice"
        />
      </div>
      <div class="flex items-center">
        <label class="w-[60px]" name="productBrand">브랜드</label>
        <select name="productBrand" v-model="productBrand">
          <option v-for="(brand, index) in brands" :value="brand.id" v-bind:key="index">
            {{ brand.name }}
          </option>
        </select>
      </div>
      <div class="flex items-center flex-wrap">
        <label class="w-[60px]" name="productImage">이미지</label>
        <input ref="image" type="file" name="productImage" accept="image/png,image/jpeg" @change="setImage" />
      </div>
      <div class="flex items-center">
        <label class="w-[60px]" name="productBarcode">바코드</label>
        <input
          class="p-2 rounded focus:ring-gray-300 focus:outline-none bg-white bg-clip-padding border border-gray-500"
          type="text"
          name="productBarcode"
          v-model="productBarcode"
        />
      </div>
      <div class="flex items-center">
        <label class="w-[60px]" name="productExpiration">유통기한</label>
        <input
          class="p-2 rounded focus:ring-gray-300 focus:outline-none bg-white bg-clip-padding border border-gray-500"
          type="date"
          name="productExpiration"
          v-model="productExpiration"
        />
      </div>
    </section>
    <div class="m-2">
      <div v-if="onUpdate" class="flex justify-between">
        <input
          type="button"
          class="px-4 py-2 hover:opacity-50 cursor-pointer rounded-md text-white bg-green-500"
          :value="title"
          @click="updateProduct"
        />
        <input
          type="button"
          class="px-4 py-2 hover:opacity-50 cursor-pointer rounded-md text-white bg-gray-500"
          value="상품등록으로"
          @click="$emit('convertToCreate'), init()"
        />
      </div>
      <input
        v-else
        type="button"
        class="px-4 py-2 hover:opacity-50 cursor-pointer rounded-md text-white bg-primary"
        :value="title"
        @click="createProduct"
      />
    </div>
  </div>
</template>
<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  props: {
    brands: {
      type: Array,
      required: true,
    },
    onUpdate: {
      type: Boolean,
      required: true,
    },
    updateProductInfo: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      productName: '',
      productPrice: '',
      productBrand: '',
      productBarcode: '',
      productExpiration: '',
      imageFile: '',
    }
  },
  computed: {
    title() {
      return this.onUpdate ? '상품수정' : '상품등록'
    },
  },
  watch: {
    updateProductInfo(item) {
      this.productName = item.pr_name
      this.productPrice = item.pr_price
      this.productBrand = item.pr_br_id
      this.productBarcode = item.pr_barcode
      this.productExpiration = item.pr_expiration
      this.imageFile = item.pr_img
    },
  },

  methods: {
    setImage(e): void {
      this.imageFile = e.target.files[0]
    },
    createProduct() {
      this.$emit('createProduct', this.createFormData())
      // :TODO add loading
    },

    updateProduct() {
      this.$emit('updateProduct', this.createFormData())
      // :TODO add loading
    },

    createFormData(): FormData {
      let formData = new FormData()
      formData.append('productName', this.productName)
      formData.append('productPrice', this.productPrice)
      formData.append('productBrand', this.productBrand)
      formData.append('productBarcode', this.productBarcode)
      formData.append('productImage', this.imageFile)
      formData.append('productExpiration', this.productExpiration)
      return formData
    },

    init() {
      this.productName = ''
      this.productPrice = ''
      this.productBrand = ''
      this.productBarcode = ''
      this.imageFile = ''
      this.productExpiration = ''
      this.$refs.image.value = ''
    },
  },
})
</script>
<style scoped>
li {
  margin-bottom: 10px;
}
.submitBtn {
  background-color: skyblue;
  width: 150px;
  height: 50px;
  cursor: pointer;
  border-radius: 10px;
}
</style>
