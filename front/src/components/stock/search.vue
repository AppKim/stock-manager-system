<template>
  <div class="bg-white-500 h-full w-full mb-1">
    <select class="border border-blue-500 border-solid rounded h-12 cursor-pointer" name="list" v-model="type">
      <option value="product">상품명</option>
      <option value="brand">브랜드</option>
      <option value="category">카테고리</option>
      <option value="owner">등록자</option>
    </select>

    <input
      class="ml-4 mr-14 bg-white w-2/3 h-12 rounded border border-blue-500 border-solid"
      type="text"
      placeholder="Search"
      v-model="query"
      @keyup.enter="getList"
    />

    <button
      class="
        border border-blue-500 border-solid
        rounded
        h-12
        cursor-pointer
        bg-blue-500
        w-40
        text-lg text-white
        hover:bg-white hover:text-blue-300 hover:shadow-none
      "
      @click="getList">
      검색
    </button>
  </div>
</template>

<style scoped></style>

<script lang="ts">
export default {
  data() {
    return {
      type: 'product',
      query: '',
    }
  },
  methods: {
    getList() {
      this.$emit('search-options', {type: this.type, query: this.query});
    }
  },
}
</script>
