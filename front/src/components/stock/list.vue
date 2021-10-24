<template>
  <div class="bg-white h-full w-full">
    <!-- suji -->
    <table>
      <thead class="h-10 bg-tableColor-bg border-b border-tableColor-border whitespace-nowrap">
        <th class="text-xs text-center text-tableColor-text px-6">상품재고ID</th>
        <th class="text-xs text-center text-tableColor-text px-6">카테고리ID</th>
        <th class="text-xs text-center text-tableColor-text px-6">브랜드</th>
        <th class="text-xs text-center text-tableColor-text px-6">가격</th>
        <th class="text-xs text-center text-tableColor-text px-6">수량</th>
        <th class="text-xs text-center text-tableColor-text px-6">수정</th>
      </thead>
      <tbody
        class="py-2.5 h-12 border-b border-tableColor-border whitespace-nowrap"
        v-for="item in this.data.items"
        v-bind:key="item.id"
      >
        <td class="px-6">{{ item.st_pr_id }}</td>
        <td class="px-6">{{ item.pr_ca_id }}</td>
        <td class="px-6">{{ item.br_name }}</td>
        <td class="px-6">{{ item.pr_price }}</td>
        <td class="px-6">{{ item.count }}</td>
        <td class="space-x-1">
          <button
            @click="$emit('showDetails', item)"
            class="px-2 py-1 bg-green-500 text-xs rounded-md text-white hover:bg-green-700"
          >
            OK
          </button>
        </td>
      </tbody>
    </table>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import { axiosGet } from "../../api/axios.js";

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
  created() {
    this.getStock()
  },
  methods: {
    getStock() {
      axiosGet('api/stocks')
        .then((rs) => {
          console.log('★★★log★★★' + JSON.stringify(rs.data))
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
  },
})
</script>

