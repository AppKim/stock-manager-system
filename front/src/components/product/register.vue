<template>
  <div class="w-full h-full bg-white ml-5">
    <h2 class="text-lg font-bold bg-tableColor-bg p-1.5">{{ title }}</h2>
    <section class="flex flex-col space-y-2 p-2">
      <div class="flex items-center">
        <label name="productName">상품명</label>
        <input
          class="p-2 rounded focus:ring-gray-300 focus:outline-none bg-white bg-clip-padding border border-gray-500"
          type="text"
          name="productName"
          v-model="productName"
        />
      </div>
      <div>
        <label name="productPrice">가격</label>
        <input
          class="p-2 rounded focus:ring-gray-300 focus:outline-none bg-white bg-clip-padding border border-gray-500"
          type="text"
          name="productPrice"
          v-model="productPrice"
        />
      </div>
      <div>
        <label name="productBrand">브랜드</label>
        <select name="productBrand" v-model="productBrand">
          <option v-for="(brand, index) in brands" :value="brand.id" v-bind:key="index">
            {{ brand.name }}
          </option>
        </select>
      </div>
      <div>
        <label name="productImage">이미지</label>
        <input type="file" name="image" accept="image/png,image/jpeg" @change="setImage" />
      </div>
      <div>
        <label name="productBarcode">바코드</label>
        <input
          class="p-2 rounded focus:ring-gray-300 focus:outline-none bg-white bg-clip-padding border border-gray-500"
          type="text"
          name="productBarcode"
          v-model="productBarcode"
        />
      </div>
      <div>
        <label name="productExpiration">유통기한</label>
        <input
          class="p-2 rounded focus:ring-gray-300 focus:outline-none bg-white bg-clip-padding border border-gray-500"
          type="date"
          name="productExpiration"
          v-model="productExpiration"
        />
      </div>
      <div>
        <input v-if="!isEdit" type="button" class="submitBtn" value="submit" @click="createProduct" />
        <input v-else type="button" class="submitBtn" value="update" @click="updateProduct" />
      </div>
    </section>
  </div>
</template>
<script>
import { axiosPost, axiosGet, axiosPut } from '@/api/axios.js'

export default {
  props: {
    isEdit: {
      type: Boolean,
      required: true,
    },
    editProductInfo: {
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
      brands: '',
    }
  },
  computed: {
    title() {
      return this.isEdit ? '상품편집' : '상품등록'
    },
  },
  watch: {
    editProductInfo(item) {
      this.productName = item.pr_name
      this.productPrice = item.pr_price
      this.productBrand = item.pr_br_id
      this.productBarcode = item.pr_barcode
      this.productExpiration = item.pr_expiration
      this.imageFile = item.pr_img
    },
  },
  created() {
    this.getBrand()
  },
  methods: {
    setImage(e) {
      this.imageFile = e.target.files[0]
    },
    createProduct() {
      let path = '/api/products'
      let formData = new FormData()
      formData.append('productName', this.productName)
      formData.append('productPrice', this.productPrice)
      formData.append('productBrand', this.productBrand)
      formData.append('productBarcode', this.productBarcode)
      formData.append('productImage', this.imageFile)
      formData.append('productExpiration', this.productExpiration)
      axiosPost(path, formData)
        .then((rs) => {
          console.log(rs)
        })
        .catch((e) => {
          console.log(e)
        })
      this.productName = ''
      this.productPrice = ''
      this.productBrand = ''
      this.productBarcode = ''
      this.productImage = null
      this.productExpiration = null
    },
    getBrand() {
      let path = 'api/brands'
      axiosGet(path)
        .then((rs) => {
          this.brands = rs.data.brands
        })
        .catch((e) => {
          console.log(e)
        })
    },
    updateProduct() {
      let formData = new FormData()
      formData.append('productName', this.productName)
      formData.append('productPrice', this.productPrice)
      formData.append('productBrand', this.productBrand)
      formData.append('productBarcode', this.productBarcode)
      formData.append('productImage', this.imageFile)
      formData.append('productExpiration', this.productExpiration)
      axiosPut('api/products', this.editProductInfo.pr_id, formData)
        .then((response) => {
          console.log(response)
        })
        .catch((error) => {
          console.log(error)
        })
    },
  },
}
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
