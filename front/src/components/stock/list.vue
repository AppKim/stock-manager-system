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
        <button class="btn medium">추가버튼</button>
      </section>
    </div>
    
<!-- suji -->

    <div class="stock-table">
      <table>
        <thead>
          <th>재고ID</th>
          <th>카테고리ID</th>
          <th>브랜드</th>
          <th>가격</th>
          <th>유통기한정보</th>
          <th>수량</th>
          <th>선택</th>
        </thead>
        <tbody>
           <tr v-for="item in this.data.items" v-bind:key="item.id">
            <td>{{ item.st_id }}</td>
            <td>{{ item.pr_ca_id }}</td>
            <td>{{ item.pr_br_id }}</td>
            <td>{{ item.pr_price }}</td>
            <td>{{ item.pr_expiration }}</td>
            <td>{{ item.st_exist }}</td>
            <td><button class="btn medium" v-on:click="conrifmRow(index)">OK</button></td>          
          </tr>
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
     data: {
      items: [],
      }
    };
  },
  created() {
    this.getStock();
    
  },
  methods: {
    getStock() {
      Axios.get("http://localhost:3000/api/stock")    
        .then((rs) => {
         //this.data.items.push(rs.data);
         console.log("★★★log★★★"+ JSON.stringify(rs.data)); 
          rs.data.forEach((element: any) => {
            this.data.items.push({
            st_id: element.st_id,
            pr_ca_id: element.pr_ca_id,
            pr_br_id: element.pr_br_id,
            pr_price: element.st_id,
            pr_expiration: element.pr_expiration,
            st_exist: element.st_exist,
             });
        });
         // this.data.items = rs.data.items;
        })
        .catch((e) => {
          console.log(e);
        });
    },
    confirmRow: function(index: any) {
   this.$confirm(index)
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

._under-lined_yev6m_10._color-blue_yev6m_12 {
    border-color: #50a4fa;
}

._under-lined_yev6m_10 {
    height: 84px;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: end;
    -ms-flex-align: end;
    align-items: flex-end;
    border-bottom: 2px solid #8f91a0;
}
.flex-fix {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 auto;
    flex: 0 0 auto;
}
*, :after, :before {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
._page-container_98tas_10 {
    padding: 0 40px 15px;
    height: 100%;
    overflow: auto;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
}
html {
    color: #292a2f;
    font-size: 14px;
    font-family: Noto Sans KR,Roboto,Dotum,"\B3CB\C6C0",Helvetica,Apple SD Gothic Neo,sans-serif;
}
.btn.medium {
    min-width: 86px;
    padding: 7px;
}
.btn {
    display: -webkit-inline-box;
    display: -ms-inline-flexbox;
    display: inline-flex;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    outline: none;
    border-radius: 6px;
    padding: 7px 9px;
    line-height: normal;
    background-color: #fff;
    border: 1px solid #cbccd3;
    -webkit-box-shadow: 0 1px 1px 0 rgb(0 0 0 / 10%);
    box-shadow: 0 1px 1px 0 rgb(0 0 0 / 10%);
    cursor: pointer;
}
.btn, .btn-multi-dropdown {
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}
button, input, optgroup, select, textarea {
    color: #292a2f;
    font-family: Noto Sans KR,Roboto,Dotum,"\B3CB\C6C0",Helvetica,Apple SD Gothic Neo,sans-serif;
}
[type=reset], [type=submit], button, html [type=button] {
    -webkit-appearance: button;
}
button, input, optgroup, select, textarea {
    font-family: sans-serif;
    font-size: 100%;
    line-height: 1.15;
    margin: 0;
}
button {
    appearance: auto;
    /* -webkit-writing-mode: horizontal-tb !important; */
    text-rendering: auto;
    color: -internal-light-dark(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: center;
    align-items: flex-start;
    cursor: default;
    background-color: -internal-light-dark(rgb(239, 239, 239), rgb(59, 59, 59));
    box-sizing: border-box;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 6px;
    border-width: 2px;
    border-style: outset;
    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
    border-image: initial;
}
.stock-info {
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}
</style>
