<template>
  <div class="bg-green-300 h-full w-full">
    <section class="flex flex-col space-y-2">
      <div>
        <label name="stockName">재고명</label>
        <input type="text" name="stockName" v-model="stockName" />
      </div>
      <div>
        <label name="stockCount">수량</label>
        <input type="text" name="stockCount" v-model="stockCount" />
      </div>
      <div>
        <input
          type="button"
          class="submitBtn"
          value="更新"
          @click="updateStock"
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
      stockCount: "",
    };
  },
  methods: {
    updateStock() {
      this.stockName = "";
      this.stockCount = "";
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
