<!--親コンポーネント-->
<template>
  <div class="flex flex-col">
    <div>
      <StockSearch v-on:search-result="searchResult"></StockSearch>
    </div>
    <button class="px-2 py-1 bg-green-500 text-xs rounded-md text-white hover:bg-green-700" @click="setCreate()">
      등록
    </button>
    <div class="flex h-full">
      <StockList v-bind:items="data.items" v-on:showdetails="showdetails"></StockList>
      <StockCreate v-if="isCreate" v-bind:brandList="data.items"></StockCreate>
      <StockEdit v-else v-on:changeEdit="setEdit" v-on:viewDetails="viewDetails"></StockEdit>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'Stock',
  data() {
    return {
      data: {
        items: [],
        type: true,
      },
      isCreate: true,
      selectedItem: [],
    }
  },
  components: {
    StockList: () => import('../components/stock/list.vue'),
    StockCreate: () => import('../components/stock/create.vue'),
    StockEdit: () => import('../components/stock/edit.vue'),
    StockSearch: () => import('../components/stock/search.vue'),
  },
  methods: {
    // 검색 결과 갱신
    searchResult(result: any) {
      this.data.items = result
    },
    // List.vue에서 받은 내용으로 조건설정
    showdetails(details: Array<any>) {
      console.group('★★★showdetails★★★')
      console.table(details)
      console.groupEnd()
      this.selectedItem = details
      this.isCreate = false
    },
    viewDetails(formData) {
      console.log('★★★viewDetails★★★')
      // this.brandList = item.br_name
    },
    setCreate() {
      this.isCreate = true
    },
    setEdit(inputValue) {
      this.isCreate = inputValue
    },
  },
})
</script>
