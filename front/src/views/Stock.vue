<!--親コンポーネント-->
<template>
  <div class="flex flex-col">
    <button class="px-2 py-1 bg-green-500 text-xs rounded-md text-white hover:bg-green-700" @click="setCreate()">
      등록
    </button>
    <div>
      <StockSearch v-on:request-search="search"></StockSearch>
    </div>
    <div class="flex h-full">
      <StockList @showlist="showlist" :items="data.items" @showdetails="showdetails"></StockList>
      <StockCreate v-if="isCreate" :brandList="items"></StockCreate>
      <StockEdit @changeEdit="setEdit" v-else @viewDetails="viewDetails"></StockEdit>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { SeacrhFn } from '../components/stock/services/stock-service'
import { SearchParams } from '../components/stock/interface/stock-interface'
import { axiosGetByCond } from '../api/axios.js'
import { axiosGet } from '../api/axios.js'

export default Vue.extend({
  name: 'Stock',
  data() {
    return {
      data: {
        items: [],
        type: true,
      },
      isCreate: false,
    }
  },
  components: {
    StockList: () => import('../components/stock/list.vue'),
    StockCreate: () => import('../components/stock/create.vue'),
    StockEdit: () => import('../components/stock/edit.vue'),
    StockSearch: () => import('../components/stock/search.vue'),
  },
  methods: {
    //리스트 화면표시
    showlist() {
      axiosGet('api/stocks')
        .then((rs) => {
          console.log('★★★showlist★★★' + JSON.stringify(rs.data))
          rs.data.forEach((element: any) => {
            this.data.items.push({
              st_pr_id: element.st_pr_id,
              pr_ca_id: element.pr_ca_id,
              br_name: element.br_name,
              pr_price: element.pr_price,
              count: element.count,
            })
          })
        })
        .catch((e) => {
          console.log(e)
        })
    },
    // 검색 기능
    search(param: SearchParams) {
      SeacrhFn(param)
        .then((result) => result.data)
        .then((data) => {
          this.data.items = data
        })
        .catch((e: Error) => console.error(`${e.name.concat('검색 에러: 통신 에러')}\n ${e.stack}`))
    },
    // List.vue에서 받은 내용으로 조건설정
    showdetails(cond: string, flg: boolean) {
      console.log('★★★showdetails★★★' + cond + ',' + flg)
      this.isCreate = flg
      //조건이 딸린 axiosGet으로 select해와야됨
      axiosGetByCond('api/stock/detail', {
        params: {
          st_pr_id: cond,
        },
      })
        .then((rs) => {
          rs.data.forEach((element: any) => {
            this.data.items.push({
              pr_name: element.pr_name,
              pr_ca_id: element.pr_ca_id,
              br_name: element.br_name,
              pr_price: element.pr_price,
              pr_expiration: element.pr_expiration,
              count: element.count,
            })
          })
        })
        .catch((e) => {
          console.log(e)
        })
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
