<template>
  <div class="bg-white h-full w-full">
    <div class="stock-table">
      <table>
        <thead>
          <th>재고ID</th>
          <th>카테고리ID</th>
          <th>브랜드</th>
          <th>가격</th>
          <th>유통기한정보</th>
          <th>수량</th>
        </thead>
        <tbody v-for="(item, index) in items" :key="index">
          <th>{{ item.array[index].st_id }}</th>
          <th>{{ item.array[index].pr_ca_id }}</th>
          <th>{{ item.array[index].pr_br_id }}</th>
          <th>{{ item.array[index].pr_price }}</th>
          <th>{{ item.array[index].pr_expiration }}</th>
          <th>{{ item.array[index].st_exist }}</th>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import Axios from "axios";

export default Vue.extend({
  name: "Stock",
  data() {
    return {
      items: [],
    };
  },
  created() {
    this.getStock();
  },
  methods: {
    getStock() {
      Axios.get("http://localhost:3000/api/stock")
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
