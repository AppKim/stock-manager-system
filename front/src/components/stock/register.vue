<template>
  <div class="bg-red-500 h-full w-full">
    <section class="flex flex-col space-y-2">
      <div>
        <label name="productName">상품명</label>
        <input type="text" name="productName" v-model="productName" />
      </div>
      <div>
        <label name="productPrice">가격</label>
        <input type="text" name="productPrice" v-model="productPrice" />
      </div>
      <div>
        <label name="productBrand">브랜드</label>
        <input type="text" name="productBrand" v-model="productBrand" />
      </div>
      <div>
        <label name="productBarcode">바코드</label>
        <input type="text" name="productBarcode" v-model="productBarcode" />
      </div>
      <div>
        <input
          type="button"
          class="submitBtn"
          value="submit"
          @click="createStock"
        />
      </div>
    </section>
  </div>
</template>
<script>
export default {
  data() {
    return {
      stockName: "",
      stockPrice: "",
      stockBrand: "",
      stockBarcode: "",
    };
  },
  methods: {
    createProduct() {
      this.stockName = "";
      this.stockPrice = "";
      this.stockBrand = "";
      this.stockBarcode = "";
    },
  },
};
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
