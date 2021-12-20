<template>
  <div class="bg-white-500 h-full w-full">
    <span class="text-area">상품</span>
    <select name="list" class="searchList" v-model="searchItems">
      <option value="1">상품명</option>
      <option value="4">등록자</option>
    </select>

    <span class="text-area">카테고리</span>
    <select id="categoryList" name="list" class="searchList" v-model="searchCategory">
      <option :value="category.id" v-for="(category, index) in category" :key="index">{{ category.name }}</option>
    </select>

    <span class="text-area">브랜드</span>
    <select id="brandList" name="list" class="searchList" v-model="searchBrand">
      <option :value="brand.id" v-for="(brand, index) in brands" :key="index">{{ brand.name }}</option>
    </select>

    <!-- 브랜드 풀다운 
      <span class="text-area">브랜드</span>
      <input type="search" class="search-brands" id="search-Menu" list="brands">
      <datalist id="brands" >
      <option :value="brand.id" v-for="(brand, index) in brands" :key="index">{{brand.name}}</option>
     </datalist> -->

    <!-- 카테고리 풀다운 
      <span class="text-area">카테고리</span>
      <input type="search" class="search-category" id="search-Menu" list="category">
      <datalist id="category" >
      <option v-for="(categoryItem, index) in category" :key="index">{{categoryItem.name}}</option>
     </datalist> -->

    <!-- 검색  -->
    <div class="serch-area">
      <input
        class="searchBar"
        type="text"
        placeholder="검색어를 입력해 주세요"
        v-model="searchContent"
        @keyup.enter="toList()"
      />
      <font-awesome-icon class="fa-search" icon="search" @click="toList()" />
      <!-- <button class="submitBtn" @click="toList">검색</button> -->
    </div>
  </div>
</template>

<script>
import Vue from 'vue'
import ListComponent from '../product/list.vue'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

export default Vue.extend({
  props: ['brands', 'category'],
  data() {
    return {
      searchContent: '',
      searchItems: '',
      searchCategory: '',
      searchBrand: '',
    }
  },
  methods: {
    toList() {
      if (
        (this.searchItems === '' &&
          this.searchContent === '' &&
          this.searchCategory === '' &&
          this.searchBrand === '') ||
        (this.searchItems !== '' && this.searchContent !== '' && this.searchCategory !== '' && this.searchBrand !== '')
      ) {
        alert('상품 또는 등록자명을 입력해 주세요')
      } else if (this.searchItems !== '') {
        console.log(this.searchItems)
        this.$emit('setInput', this.searchItems, this.searchContent)
        this.searchContent = ''
      } else if (this.searchCategory !== '') {
        this.$emit('serchSelectbox', this.searchCategory)
        //this.searchContent = ''
      } else if (this.searchBrand !== '') {
        this.$emit('serchSelectbox', this.searchBrand)
        //this.searchContent = ''
      }
    },
    toSearch() {
      const brandCheck = document.querySelector('.search-brands')
      const categoryCheck = document.querySelector('.search-category')
      if (
        (brandCheck.value.length === 0 && categoryCheck.value.length === 0) ||
        (brandCheck.value.length !== 0 && categoryCheck.value.length !== 0)
      ) {
        alert('다시 확인해주세요')
      } else if (brandCheck.value.length !== 0) {
        console.log(brandCheck.value)
        this.$emit('serchSelectbox', brandCheck.value)
      } else if (categoryCheck.value.length !== 0) {
        this.$emit('serchSelectbox', categoryCheck.value)
      }
    },
    toTest() {
      console.log(this.searchCategory)
      if (this.searchCategory === null) {
        console.log('null')
      } else {
        console.log('not null')
      }
    },
  },
})
</script>

<style scoped>
ul,
ol,
li {
  list-style: none;
  margin: 0;
  padding: 0;
}
.searchBar {
  width: 62%;
  border-color: #bbb;
  border-radius: 16px;
  border-width: 1px;
  padding: 6px 0 6px 0;
  margin: 6px;
}

.searchList {
  margin-right: 10px;
  border: 1px solid #bbb;
  border-radius: 16px;
  width: 80px;
  height: 30px;
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

.fa-search:hover {
  color: black;
  cursor: pointer;
}
</style>
