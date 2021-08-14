<template>
  <div class="bg-red-500 h-full w-full">
    <section>
      <label>상품명</label>
      <input type="text" v-model="productName" />

      <input type="button" @click="registerProduct" value="등록" />
    </section>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
export default Vue.extend({
  data() {
    return {
      productName: "",
    };
  },
  methods: {
    registerProduct() {
      console.log(this.productName);
    },
  },
});
</script>

<style scoped></style>
