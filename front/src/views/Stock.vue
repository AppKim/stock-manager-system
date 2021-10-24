<!--親コンポーネント-->
<template>
  <div>
    <div>
      <StockSearch></StockSearch>
    </div>
    <div class="flex h-full">
      <StockList @showdetails="showdetails"></StockList>
      <StockRegister :brandList="brandList" @viewDetails="viewDetails"></StockRegister>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { axiosPost, axiosGet, axiosPut } from '@/api/axios.js'

export default Vue.extend({
  name: 'Stock',
  data() {
    return {
      brandNameCondition: [],
      expirationCondition: [],
      // brandList: {
      //   brands: [],
      //   type: true,
      // },
      stockCount: [],
    }
  },
  components: {
    StockList: () => import('@/components/stock/list.vue'),
    StockRegister: () => import('@/components/stock/register.vue'),
    StockSearch: () => import('@/components/stock/search.vue'),
  },
  methods: {
    //List.vue에서 받은 내용으로 조건설정
    showdetails(item) {
      console.log('★★★showdetails★★★')
      this.brandNameCondition = item.br_name
      this.stockProductIdCondition = item.st_pr_id
      this.productCategoryCondition = item.pr_ca_id
      console.log('brandNameCondition' + this.brandNameCondition)
      console.log('stockProductIdCondition' + this.stockProductIdCondition)
      console.log('productCategoryCondition' + this.productCategoryCondition)

      //조건이 딸린 axiosGet으로 select해와야됨
    },
    viewDetails(formData) {
      console.log('★★★viewDetails★★★')
      this.brandList = item.br_name
    },
  },
})
</script>
