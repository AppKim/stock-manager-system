<template>
  <div class="bg-white-500 h-full w-full">
    <select name="list" class="searchList" v-model="searchItems">
      <option value="1">상품명</option>
      <option value="2">브랜드</option>
      <option value="3">카테고리</option>
      <option value="4">등록자</option>
    </select>
    <select id="categoryList" name="list" class="searchList" v-model="searchItems">
      <option value="5">카테고리</option>
    </select>
      <span class="text-area">브랜드</span>
      <input type="search" id="search-Menu" list="brands">
      <datalist id="brands">
      <option value="jinro"></option>
      <option value="jinro"></option>
     </datalist>
      <span class="text-area">카테고리</span>
      <input type="search" id="search-Menu" list="category">
      <datalist id="category">
      <option value="Drink"></option>
      <option value="Drink"></option>
     </datalist>
    <div class="serch-area">
    <input class="searchBar" type="text"
    placeholder="검색어를 입력해 주세요" v-model="searchContent" @keyup.enter="toList" />
    <font-awesome-icon class="fa-search" icon="search" />
    <!-- <button class="submitBtn" @click="toList">검색</button> -->
    </div>
  
  </div>
</template>

<script>
import Vue from 'vue'
import ListComponent from '../product/list.vue'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

export default Vue.extend({
  props: ['brands'],
  data() {
    return {
      searchContent: '',
      searchItems: '',
      searchCategory: '',
    }
  },
  methods: {
    toList() {
      if (this.searchContent === '') {
        alert('검색어를 입력해 주세요')
      } else if (this.searchItems !== null) {
        this.$emit('setInput', this.searchItems, this.searchContent)
        this.searchContent = ''
      } else if (this.searchCategory !== null) {
        this.$emit('setInput', this.searchCategory, this.searchContent)
        this.searchContent = ''
      }
    },
  },
})
</script>

<style scoped>
ul, ol, li { list-style:none; margin:0; padding:0; }
.searchBar {
  width:62%;
  border-color: #bbb;
  border-radius: 16px;
  border-width: 1px;
  padding: 6px 0 6px 0;
  margin: 6px;
}

.searchList {
  margin-right: 10px;
  border: 1px solid dodgerblue;
  border-radius: 5px;
  height: 50px;
  cursor: pointer;
}

.submitBtn {
  margin-left: 30px;
  background-color: dodgerblue;
  font-size: 18px;
  color: white;
  width: 120px;
  height: 50px;
  cursor: pointer;
  border-radius: 10px;
}

.submitBtn:hover {
  box-shadow: none;
  color: #000066;
  background: #ffffff;
}

.text-area {
  margin-left: 10px;
  padding: 10px;
}

#search-Menu {
  width: 90px;
  height: 40px;
  background: #ffffff;
  border-radius: 10px;
}

.fa-search {
  color: whitesmoke;
}


</style>
