<template>
  <div class="bg-white-500 h-full w-full">
    <select name="list" class="searchList">
      <option value="product">상품명</option>
      <option value="product">브랜드</option>
      <option value="product">카테고리</option>
      <option value="product">등록자</option>
    </select>
    <input class="searchBar" type="text" value="" placeholder="Search" v-model="searchContent" @keyup.enter="toList">

    <button class="submitBtn" @click="toList">검색</button>

  </div>
</template>

<script>
import EventBus from '../common/eventBus/event-bus';
import ListComponent from '../product/list.vue';

export default {
  data(){
    return {
      searchContent: '',
    }
  },
  methods: {
    toList () {
      this.$emit('setInput',this.searchContent);
      this.searchContent = '';
      
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
