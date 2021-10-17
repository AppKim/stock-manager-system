<template>
  <div class="bg-white h-full w-full">
    <!-- suji -->
    <div class="_under-lined_yev6m_10 _color-blue_yev6m_12 flex-fix">
      <section class="_title-section_yev6m_90">
        <div class="_breadcrumbs_yev6m_6"></div>
        <div class="_title_yev6m_25">
          <div class="_main-title_yev6m_123">재고 목록</div>
        </div>
      </section>
      <section class="_additional-buttons_yev6m_38">
        <button
          class="w-55 h-12 text-white bg-primary rounded-full hover:bg-dark"
        >
          추가버튼
        </button>
      </section>
    </div>

    <!-- suji -->

    <div class="stock-table">
      <table>
        <thead>
          <th>상품재고ID</th>
          <th>카테고리ID</th>
          <th>브랜드</th>
          <th>가격</th>
          <th>유통기한정보</th>
          <th>수량</th>
          <th>선택</th>
        </thead>
        <tbody>
          <tr v-for="item in this.data.items" v-bind:key="item.id">
            <td>{{ item.st_pr_id }}</td>
            <td>{{ item.pr_ca_id }}</td>
            <td>{{ item.pr_br_id }}</td>
            <td>{{ item.pr_price }}</td>
            <td>{{ item.pr_expiration }}</td>
            <td>{{ item.count }}</td>
            <td>
              <button
                class="
                  w-full
                  h-12
                  text-white
                  bg-primary
                  rounded-full
                  hover:bg-dark
                "
                v-on:click="conrifmRow(index)"
              >
                OK
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import { axiosGet } from "../../api/axios.js";

export default Vue.extend({
  name: "Stock",
  data() {
    return {
      data: {
        items: [],
        type: true,
      },
    };
  },
  created() {
    this.getStock();
  },
  methods: {
    getStock() {
      axiosGet("api/stock")
        .then((rs) => {
          //this.data.items.push(rs.data);
          console.log("★★★log★★★" + JSON.stringify(rs.data));
          rs.data.forEach((element: any) => {
            this.data.items.push({
              st_pr_id: element.st_pr_id,
              pr_ca_id: element.pr_ca_id,
              pr_br_id: element.pr_br_id,
              pr_price: element.pr_price,
              pr_expiration: element.pr_expiration,
              count: element.count,
            });
          });
          // this.data.items = rs.data.items;
        })
        .catch((e) => {
          console.log(e);
        });
    },
    confirmRow: function (index: any) {
      this.$confirm(index);
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
