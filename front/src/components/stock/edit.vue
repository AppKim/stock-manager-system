<template>
  <div class="bg-white h-full w-full p-2.5">
    <h2 class="text-2xl font-bold bg-tableColor-bg p-1.5">상품 수정</h2>
    <hr class="mt-2.5 mb-2.5" />
    <section class="flex flex-col space-y-2">
      <div class="flex justify-between items-center">
        <label name="expiration">유통기한</label>
        <input
          type="date"
          class="p-2 rounded focus:ring-gray-300 focus:outline-none bg-white bg-clip-padding border border-gray-500"
          name="stockCount"
          v-model="stockDetail.pr_expiration"
          :disabled="disabled"
        />
      </div>
      <div class="flex justify-between items-center">
        <label name="stockBrand">브랜드명</label>
        <select
          v-model="stockDetail.br_name"
          v-bind:disabled="disabled"
          class="p-2 rounded focus:ring-gray-300 focus:outline-none bg-white bg-clip-padding border border-gray-500"
        >
          <option v-for="(brand, i) in brandList" v-bind:key="i">{{ brand }}</option>
        </select>
      </div>
      <div class="flex justify-between items-center">
        <label name="stockId">가격</label>
        <input
          type="number"
          class="p-2 rounded focus:ring-gray-300 focus:outline-none bg-white bg-clip-padding border border-gray-500"
          name="stockCount"
          v-model="stockDetail.pr_price"
          :disabled="disabled"
        />
      </div>
      <div class="flex justify-between items-center">
        <label name="stockCount">수량</label>
        <input
          type="number"
          class="p-2 rounded focus:ring-gray-300 focus:outline-none bg-white bg-clip-padding border border-gray-500"
          name="stockCount"
          v-model="stockDetail.count"
          :disabled="disabled"
        />
      </div>
      <div class="flex justify-center items-end">
        <input
          type="button"
          class="px-4 py-2 hover:opacity-50 cursor-pointer rounded-md text-white bg-green-500"
          value="수정"
          @click="changeitemcount()"
        />
        <button class="px-4 py-2 hover:opacity-50 cursor-pointer rounded-md text-white bg-gray-500">취소</button>
      </div>
    </section>
  </div>
</template>

<script lang="ts">
export default {
  props: {
    stockDetail: {
      type: Object,
    },
    brandList: {
      type: Array,
      required: true,
    },
  },
  data() {
    return {
      expiration: '',
      brandName: '',
      price: 0,
      stockCount: 0,

      disabled: false,
    }
  },
  // created() {
  //   this.getBrand();
  // },
  methods: {
    inputStock() {
      this.stockName = ''
      this.stockCount = ''
      this.stockBrand = ''
    },
    createStock() {
      this.$emit('changeitemcount', this.createFormData())
    },

    changeFormData(): FormData {
      let formData = new FormData()
      formData.append('stockCount', this.stockCount)
      return formData
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
