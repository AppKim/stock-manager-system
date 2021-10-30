<template>
  <div class="bg-white-500 h-full w-full">
    <select name="list" class="searchList" v-model="searchItems">
      <option value="1">상품명</option>
      <option value="2">브랜드</option>
      <option value="3">카테고리</option>
      <option value="4">등록자</option>
    </select>
     <select name="list" class="searchList" v-model="searchItems">
      <option value="5">카테고리</option>
     </select>
    <input class="searchBar" type="text" value="" placeholder="Search" v-model="searchContent" @keyup.enter="toList">

    <button class="submitBtn" @click="toList">검색</button>
  </div>
</template>

<script>
import ListComponent from '../product/list.vue';

export default {
  data(){
    return {
      searchContent: '',
      searchItems: '',
      searchCategory: '',
    }
  },
  methods: {
    toList () {
      if(this.searchContent === '') {
        alert('검색어를 입력해 주세요');
      }else if(this.searchItems !== null){
      this.$emit('setInput', this.searchItems, this.searchContent);
      this.searchContent = '';
      }else if(this.searchCategory !== null) {
      this.$emit('setInput', this.searchCategory, this.searchContent);
      this.searchContent = '';
      }
    }
  },
};


</script>

<style scoped>

.searchBar {
  margin-left: 20px;
  margin-bottom: 20px;
  background    : #ffffff;  
  border: 1px solid dodgerblue;
  border-style: groove; 
  border-radius: 5px;
  width: 70%;
  height: 50px;
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
  box-shadow    : none;        
  color         : #000066;     
  background    : #ffffff;  
}


</style>
