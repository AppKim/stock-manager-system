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
      <StockList v-bind:items="data.items" v-on:initialized="initialized" v-on:showdetails="showdetails"></StockList>
      <StockCreate
        v-if="isCreate"
        v-bind:brandList="Array.from(new Set(data.items.map((el) => el.br_name)))"
      ></StockCreate>
      <StockEdit
        v-else
        v-bind:stockDetail="selectedItem"
        v-on:changeEdit="setEdit"
        v-on:viewDetails="viewDetails"
      ></StockEdit>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { IStockDetailModel, IStockModel } from '../components/stock/interface/stock-interface'

export default Vue.extend({
  name: 'Stock',
  data() {
    return {
      data: {
        items: [],
        type: true,
      },
      isCreate: false,
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
    searchResult(result: IStockModel) {
      this.data.items = result
    },
    initialized(data: Array<IStockModel>) {
      this.data.items = data
    },
    // List.vue에서 받은 내용으로 조건설정
    showdetails(details: Array<IStockDetailModel>) {
      console.group('★★★showdetails★★★')
      console.table(details)
      console.groupEnd()
      this.selectedItem = details
      this.isCreate = false
    },
    viewDetails(formData: any) {
      console.log('★★★viewDetails★★★')
      // this.brandList = item.br_name
    },
    setCreate() {
      this.isCreate = true
    },
    setEdit(inputValue: any) {
      this.isCreate = inputValue
    },
  },
})
</script>
