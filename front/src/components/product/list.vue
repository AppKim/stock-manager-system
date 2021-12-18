<template>
  <div class="bg-white w-full h-full">
    <table>
      <thead class="h-10 bg-tableColor-bg border-b border-tableColor-border whitespace-nowrap">
        <th class="text-xs text-center text-tableColor-text px-2">상품ID</th>
        <th class="text-xs text-center text-tableColor-text px-2">카테고리명</th>
        <th class="text-xs text-center text-tableColor-text px-2">브랜드</th>
        <th class="text-xs text-center text-tableColor-text px-2">가격</th>
        <th class="text-xs text-center text-tableColor-text px-2">바코드정보</th>
        <th class="text-xs text-center text-tableColor-text px-2">상품이미지</th>
        <th class="text-xs text-center text-tableColor-text px-2">유통기한정보</th>
        <th class="text-xs text-center text-tableColor-text px-2">등록자</th>
        <th class="text-xs text-center text-tableColor-text px-2">편집 / 삭제</th>
      </thead>
      <!-- <div v-if="search.length == 0"> -->
      <tbody
        class="py-2.5 h-12 border-b border-tableColor-border whitespace-nowrap"
        v-for="(item, index) in items"
        :key="index"
      >
        <td class="px-2">{{ item.pr_id }}</td>
        <td class="px-2">{{ item.ca_name }}</td>
        <td class="px-2">{{ item.br_name }}</td>
        <td class="px-2">{{ item.pr_price }}</td>
        <td class="px-2">{{ item.pr_barcode }}</td>
        <td>
          <img class="max-w-none px-2 py-1" width="100px" src="http://picsum.photos/100" />
        </td>
        <td class="px-2">{{ item.pr_expiration }}</td>
        <td class="px-2">{{ item.pr_us_id }}</td>
        <td class="space-x-1">
          <button
            @click="clickEditBtn(item)"
            class="px-2 py-1 bg-green-500 text-xs rounded-md text-white hover:bg-green-700"
          >
            편집
          </button>
          <button
            @click="clickDeleteBtn(item.pr_id, index)"
            class="px-2 py-1 bg-red-500 text-xs rounded-md text-white hover:bg-red-700"
          >
            삭제
          </button>
        </td>
      </tbody>
    </table>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'Product',
  props: ['items', 'search'],
  data() {
    return {}
  },
  methods: {
    clickDeleteBtn(pr_id: string): void {
      this.$emit('deleteProduct', pr_id)
    },
    clickEditBtn(pr_id: string) {
      this.$emit('editProduct', pr_id)
    },
  },
})
</script>
