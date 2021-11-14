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
        v-for="item in this.items"
        v-bind:key="item.id"
      >
        <td class="px-6">{{ item.st_pr_id }}</td>
        <td class="px-6">{{ item.pr_ca_id }}</td>
        <td class="px-6">{{ item.br_name }}</td>
        <td class="px-6">{{ item.pr_price }}</td>
        <td class="px-6">{{ item.count }}</td>
        <td class="space-x-1">
          <button
            class="px-2 py-1 bg-green-500 text-xs rounded-md text-white hover:bg-green-700"
            @click="requestDeatil(item.st_pr_id)"
          >
            OK
          </button>
        </td>
      </tbody>
    </table>
  </div>
</template>

<script lang="ts">
import { IResponse, IStockDetailModel, IStockModel } from './interface/stock-interface'
import { RequestList, RequestDetail } from './services/stock-service'

export default {
  name: 'Stock',
  props: ['items'],
  data() {
    return {
      data: {
        items: [],
        type: true,
      },
      isCreate: false,
    }
  },
  created() {
    // 리스트 취득 API
    RequestList()
      .then((rs: IResponse<IStockModel>) => {
        console.group('★★★showlist★★★')
        console.table(rs.data)
        console.groupEnd()
        return rs.data
      })
      .then((data: Array<IStockModel>) => {
        this.data.items = data
        this.$emit.apply(this, ['initialized', JSON.parse(JSON.stringify(this.data.items))])
      })
      .catch((e: Error) => {
        console.error(`${e.name.concat('리스트 취득 에러')}\n${e.stack}`)
      })
  },
  methods: {
    requestDeatil(st_pr_id: number) {
      RequestDetail({ st_pr_id })
        .then((rs: IResponse<IStockDetailModel>) => rs.data)
        .then((data: Array<IStockDetailModel>) => {
          this.$emit.apply(this, ['showdetails', data.length > 0 ? data[0] : []])
        })
        .catch((e: Error) => {
          console.error(`${e.name.concat('상세정보 취득 에러')}\n${e.stack}`)
        })
    },
  },
}
</script>
