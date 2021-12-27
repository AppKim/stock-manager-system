<template>
  <div class="ml-5">
    <div class="w-[400px] mt-5 md:mt-0 md:col-span-2">
      <div class="shadow overflow-hidden sm:rounded-md">
        <h2 class="text-lg font-bold bg-tableColor-bg p-2">{{ title }}</h2>
        <div class="px-4 py-5 bg-white sm:p-6">
          <div class="grid grid-cols-6 gap-6">
            <div class="col-span-6 sm:col-span-3">
              <label for="first-name" class="block text-sm font-medium text-gray-700">상품명</label>
              <input
                v-model="productName"
                type="text"
                name="product-name"
                class="
                  mt-1
                  focus:ring-indigo-500 focus:border-indigo-500
                  block
                  w-full
                  shadow-sm
                  sm:text-sm
                  border-gray-300
                  rounded-md
                "
              />
            </div>

            <div class="col-span-6 sm:col-span-3">
              <label for="last-name" class="block text-sm font-medium text-gray-700">가격</label>
              <input
                type="text"
                v-model="productPrice"
                name="product-price"
                class="
                  mt-1
                  focus:ring-indigo-500 focus:border-indigo-500
                  block
                  w-full
                  shadow-sm
                  sm:text-sm
                  border-gray-300
                  rounded-md
                "
              />
            </div>
            <div class="col-span-6 sm:col-span-4">
              <label class="block text-sm font-medium text-gray-700">바코드</label>
              <input
                name="productBarcode"
                v-model="productBarcode"
                type="text"
                class="
                  mt-1
                  focus:ring-indigo-500 focus:border-indigo-500
                  block
                  w-full
                  shadow-sm
                  sm:text-sm
                  border-gray-300
                  rounded-md
                "
              />
            </div>

            <div class="col-span-6 sm:col-span-3">
              <label for="country" class="block text-sm font-medium text-gray-700">브랜드</label>
              <select
                class="
                  mt-1
                  block
                  w-full
                  py-2
                  px-3
                  border border-gray-300
                  bg-white
                  rounded-md
                  shadow-sm
                  focus:outline-none focus:ring-indigo-500 focus:border-indigo-500
                  sm:text-sm
                "
                name="productBrand"
                v-model="productBrand"
              >
                <option v-for="(brand, index) in brands" :value="brand.id" v-bind:key="index">
                  {{ brand.name }}
                </option>
              </select>
            </div>

            <div class="col-span-6">
              <label class="block text-sm font-medium text-gray-700"> 상품이미지 </label>
              <div class="mt-1 flex justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-md">
                <div class="space-y-1 text-center">
                  <svg
                    class="mx-auto h-12 w-12 text-gray-400"
                    stroke="currentColor"
                    fill="none"
                    viewBox="0 0 48 48"
                    aria-hidden="true"
                  >
                    <path
                      d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02"
                      stroke-width="2"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                    />
                  </svg>
                  <div class="flex text-sm text-gray-600">
                    <label
                      for="file-upload"
                      class="
                        relative
                        cursor-pointer
                        bg-white
                        rounded-md
                        font-medium
                        text-indigo-600
                        hover:text-indigo-500
                        focus-within:outline-none
                        focus-within:ring-2
                        focus-within:ring-offset-2
                        focus-within:ring-indigo-500
                      "
                    >
                      <span>Upload a file</span>
                      <input id="file-upload" name="file-upload" type="file" class="sr-only" />
                    </label>
                    <p class="pl-1">or drag and drop</p>
                  </div>
                  <p class="text-xs text-gray-500">PNG, JPG, GIF up to 10MB</p>
                </div>
              </div>
            </div>

            <div class="col-span-6 sm:col-span-4">
              <label class="w-[60px]" name="productExpiration">유통기한</label>
              <input
                class="
                  mt-1
                  focus:ring-indigo-500 focus:border-indigo-500
                  block
                  w-full
                  shadow-sm
                  sm:text-sm
                  border-gray-300
                  rounded-md
                "
                type="date"
                name="productExpiration"
                v-model="productExpiration"
              />
            </div>
          </div>
        </div>
        <div class="px-4 py-3 bg-gray-50 text-right sm:px-6">
          <div v-if="onUpdate" class="flex justify-between">
            <input
              type="button"
              class="
                inline-flex
                justify-center
                py-2
                px-4
                border border-transparent
                shadow-sm
                text-sm
                font-medium
                rounded-md
                text-white
                bg-indigo-600
                hover:bg-indigo-700
                focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500
              "
              :value="title"
              @click="updateProduct"
            />
            <input
              type="button"
              class="
                inline-flex
                justify-center
                py-2
                px-4
                border border-transparent
                shadow-sm
                text-sm
                font-medium
                rounded-md
                text-white
                bg-indigo-600
                hover:bg-indigo-700
                focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500
              "
              value="상품등록으로"
              @click="$emit('convertToCreate'), init()"
            />
          </div>
          <input
            v-else
            type="button"
            class="
              inline-flex
              justify-center
              py-2
              px-4
              border border-transparent
              shadow-sm
              text-sm
              font-medium
              rounded-md
              text-white
              bg-indigo-600
              hover:bg-indigo-700
              focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500
            "
            :value="title"
            @click="createProduct"
          />
        </div>
      </div>
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
      this.productExpiration = new Date(item.pr_expiration).toISOString().slice(0, 10)
      this.imageFile = item.pr_img
      console.log(item)
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
