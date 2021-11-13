<template>
  <div class="bg-white-500 h-full w-full mb-1">
    <select class="border border-blue-500 border-solid rounded h-12 cursor-pointer" name="list" v-model="type">
      <option v-bind:value="stock_enum.st_pr_id">상품 ID</option>
      <option v-bind:value="stock_enum.pr_ca_id">카테고리 ID</option>
      <option v-bind:value="stock_enum.br_name">브랜드</option>
    </select>

    <input
      class="ml-4 mr-14 bg-white w-2/3 h-12 rounded border border-blue-500 border-solid"
      type="text"
      placeholder="검색어를 입력해 주십시오"
      v-model="query"
      v-on:keyup.enter="requestSearch"
    />

    <button
      class="
        border border-blue-500 border-solid
        rounded
        w-40
        h-12
        cursor-pointer
        bg-blue-500
        text-lg text-white
        hover:bg-white hover:text-blue-300 hover:shadow-none
        disabled:opacity-50
      "
      v-on:click="requestSearch"
      v-bind:disabled="query.length < 1"
    >
      검색
    </button>
  </div>
</template>

<style scoped></style>

<script lang="ts">
import { StockCategoryId } from './enum/stock.enum'
import { SearchParams } from './interface/stock-interface'

export default {
  data() {
    return {
      type: StockCategoryId.st_pr_id,
      query: '',
      stock_enum: StockCategoryId,
    }
  },
  methods: {
    requestSearch() {
      const searchParm: SearchParams = { type: this.type, query: this.query }
      this.$emit('request-search', searchParm)
    },
  },
}
</script>
