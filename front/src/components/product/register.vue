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
        <select name="productBrand" v-model="productBrand">
          <option
            v-for="(brand, index) in brands"
            :value="brand.id"
            v-bind:key="index"
          >
            {{ brand.name }}
          </option>
        </select>
      </div>
      <div>
        <label name="productImage">이미지</label>
        <input
          type="file"
          name="image"
          accept="image/png,image/jpeg"
          @change="setImage"
        />
      </div>
      <div>
        <label name="productBarcode">바코드</label>
        <input type="text" name="productBarcode" v-model="productBarcode" />
      </div>
      <div>
        <label name="productExpiration">유통기한</label>
        <input
          type="date"
          name="productExpiration"
          v-model="productExpiration"
        />
      </div>
      <div>
        <input
          type="button"
          class="submitBtn"
          value="submit"
          @click="createProduct"
        />
      </div>
    </section>
  </div>
</template>
<script>
import { axiosPost, axiosGet } from "@/api/axios.js";

export default {
  data() {
    return {
      productName: "",
      productPrice: "",
      productBrand: "",
      productBarcode: "",
      productExpiration: "",
      imageFile: "",
      brands: "",
    };
  },
  created() {
    this.getBrand();
  },
  methods: {
    setImage(e) {
      this.imageFile = e.target.files[0];
    },
    createProduct() {
      let path = "/api/products";
      let formData = new FormData();
      formData.append("productName", this.productName);
      formData.append("productPrice", this.productPrice);
      formData.append("productBrand", this.productBrand);
      formData.append("productBarcode", this.productBarcode);
      formData.append("productImage", this.imageFile);
      formData.append("productExpiration", this.productExpiration);
      axiosPost(path, formData)
        .then((rs) => {
          console.log(rs);
        })
        .catch((e) => {
          console.log(e);
        });

      this.productName = "";
      this.productPrice = "";
      this.productBrand = "";
      this.productBarcode = "";
      this.productImage = null;
      this.productExpiration = null;
    },
    getBrand() {
      let path = "api/brands";
      axiosGet(path)
        .then((rs) => {
          this.brands = rs.data.brands;
        })
        .catch((e) => {
          console.log(e);
        });
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
