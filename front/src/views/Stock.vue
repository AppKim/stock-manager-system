<!--親コンポーネント-->
<template>
  <div class="flex flex-col">
    <div>
      <StockSearch v-on:search-options="search"></StockSearch>
    </div>
    <div class="flex h-full">
      <StockList @showdetails="showdetails"></StockList>
      <StockRegister :brandList="items" @viewDetails="viewDetails"></StockRegister>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { SeacrhFn } from '../components/stock/services/stock-service'
import { SearchParams } from '../components/stock/services/stock-interface'
import { axiosPost, axiosGet, axiosPut } from '@/api/axios.js'

export default Vue.extend({
  name: 'Stock',
  data() {
    return {
      data: {
        items: [],
        type: true,
      },
    }
  },
  components: {
    StockList: () => import('../components/stock/list.vue'),
    StockRegister: () => import('../components/stock/register.vue'),
    StockSearch: () => import('../components/stock/search.vue'),
  },
  methods: {
    // 검색 기능
    search(param: SearchParams) {
      SeacrhFn(param)
    },
    // List.vue에서 받은 내용으로 조건설정
    showdetails(item) {
      console.log('★★★showdetails★★★')
      this.item = item
      //조건이 딸린 axiosGet으로 select해와야됨
      axiosGet('api/stock/detail', item)
        .then((rs) => {
          console.log('★★★showdetailsResult★★★')
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
    viewDetails(formData) {
      console.log('★★★viewDetails★★★')
      // this.brandList = item.br_name
    },
  },
})
</script>
