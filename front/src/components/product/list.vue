<template>
  <div class="bg-white h-full w-full">
    <div class="produc-table">
      <table>
        <thead>
          <th>상품ID</th>
          <th>카테고리명</th>
          <th>브랜드</th>
          <th>가격</th>
          <th>바코드정보</th>
          <th>상품이미지</th>
          <th>유통기한정보</th>
          <th>등록자</th>
        </thead>
        <tbody v-for="(item, index) in items" :key="index">
          <th>{{ item.pr_id }}</th>
          <th>{{ item.pr_ca_id }}</th>
          <th>{{ item.pr_br_id }}</th>
          <th>{{ item.pr_price }}</th>
          <th>{{ item.pr_barcode }}</th>
          <th>{{ item.pr_img }}</th>
          <th>{{ item.pr_expiration }}</th>
          <th>{{ item.pr_us_id }}</th>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import Axios from "axios";

export default Vue.extend({
  name: "Product",
  data() {
    return {
      items: [],
    };
  },
  created() {
    this.getProduct();
  },
  methods: {
    getProduct() {
      Axios.get("http://localhost:3000/api/products")
        .then((rs) => {
          this.items.push(rs.data);
        })
        .catch((e) => {
          console.log(e);
        });
    },
  },
});
</script>
<style scoped>
table,
th,
td {
  border: 1px solid black;
}
</style>
