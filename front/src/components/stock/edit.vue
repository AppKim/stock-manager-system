<template >
  <div class="bg-white h-full w-full">
    <h2 class="text-lg font-bold bg-tableColor-bg p-1.5">상품 수정</h2>
    <section class="flex flex-col space-y-2">
      <div>
        <label name="expiration">유통기한</label>
        <input type="date" class="p-2 rounded focus:ring-gray-300 focus:outline-none bg-white bg-clip-padding border border-gray-500" id="start" name="trip-start" value="2021-08-29">
      </div>
      <div>
        <label name="stockId">상품명</label>
          <select name="products" id="products-select">
          </select>
      </div>
      <div>
        <label name="stockCount">수량</label>
        <input type="text" class="p-2 rounded focus:ring-gray-300 focus:outline-none bg-white bg-clip-padding border border-gray-500" name="stockCount" v-model="stockCount"/>
      </div>
      <div>
        <input
          type="button"
          class="px-4 py-2 hover:opacity-50 cursor-pointer rounded-md text-white bg-green-500"
          value="등록"
        />
        <button class="px-4 py-2 hover:opacity-50 cursor-pointer rounded-md text-white bg-gray-500">취소</button>
      </div>
    </section>
  </div>
</template>


<script lang="ts">
import Vue from "vue";
import listvue from './list.vue'
export default Vue.extend({
  data() {
    return {
      expiration: "",
      stockId: "",
      brandId: "",
      stockCount: "",
    };
  },
  // created() {
  //   this.getBrand();
  // },
});
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
