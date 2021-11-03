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
import { SearchParams } from '../components/stock/interface/stock-interface'
import { axiosPost, axiosGet, axiosPut, axiosGetByCond } from '@/api/axios.js'

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
        .then((result) => console.log('result', result.data))
        .catch((err) => err)
    },
    // List.vue에서 받은 내용으로 조건설정
    showdetails(cond) {
      console.log('★★★showdetails★★★' + cond)
      //조건이 딸린 axiosGet으로 select해와야됨
      axiosGetByCond('api/stock/detail', cond)
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
  },
})
</script>
