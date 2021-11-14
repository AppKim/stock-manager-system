<!--親コンポーネント-->
<template>
  <div class="flex flex-col">
    <header>
      <StockSearch v-on:search-result="searchResult"></StockSearch>
    </header>
    <button class="px-2 py-1 bg-green-500 text-xs rounded-md text-white hover:bg-green-700" @click="setCreate()">
      등록
    </button>
    <section class="flex h-full gap-5">
      <article class="flex-auto">
        <StockList v-bind:items="data.items" v-on:initialized="initialized" v-on:showdetails="showdetails"></StockList>
      </article>
      <article class="flex-auto">
        <StockCreate v-if="isCreate" v-bind:brandList="brandList"></StockCreate>
        <StockEdit
          v-else
          v-bind:stockDetail="selectedItem"
          v-bind:brandList="brandList"
          v-on:changeEdit="setEdit"
          v-on:viewDetails="viewDetails"
        ></StockEdit>
      </article>
    </section>
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
      selectedItem: {},
      brandList: [],
    }
  },
  components: {
    StockList: () => import('../components/stock/list.vue'),
    StockCreate: () => import('../components/stock/create.vue'),
    StockEdit: () => import('../components/stock/edit.vue'),
    StockSearch: () => import('../components/stock/search.vue'),
  },
  methods: {
    searchResult(result: IStockModel) {
      // 검색 결과 갱신
      this.data.items = result
    },
    initialized(data: Array<IStockModel>) {
      // List에서 최초 데이터 취득
      this.data.items = data
      // 브랜드 리스트(set 으로 브랜드 중복 제거)
      this.brandList = Array.from(new Set(data.map((el) => el.br_name)))
    },
    // List.vue에서 받은 내용으로 조건설정
    showdetails(details: Array<IStockDetailModel>) {
      console.group('★★★showdetails★★★')
      console.table(details)
      console.groupEnd()
      // 이벤트를 선택 항목으로 할당 하고 수정모드로 전환
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
