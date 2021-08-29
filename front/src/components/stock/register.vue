<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/1.0.18/vue.min.js"></script>
<template >
  <div v-if="details">
    <div id = "app" class="bg-green-300 h-full w-full">
      <section class="flex flex-col space-y-2">
        <h1>Detail &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button @click="disabled = !disabled" class="button">활성화</button></h1>
        <div>
          <label name="expiration">유통기한 :</label>
          <input type="date" id="start" name="trip-start" value="2021-08-29" :disabled="disabled">
        </div>
        <div>
          <label name="stockId">제품명:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
          <input type="text" name="stockId" v-model="stockId" :disabled="disabled"/>
        </div>
        <div>
          <label name="brandId">브랜드명 :</label>
            <select name="pets" id="pet-select" :disabled="disabled">
              <option v-for="( brand, i ) in brandList" :key="i">{{ brand }}</option>
            </select>
        </div>
        <div>
          <label name="stockCount">수량:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
          <input type="text" name="stockCount" v-model="stockCount" :disabled="disabled"/>
        </div>
        <div>
          <input
            type="button"
            class="submitBtn"
            value="등록"
            @click="inputStock"
          />
          <button class="submitBtn" id="cancelStock">취소</button>
        </div>
      </section>
    </div>
  </div>

  <div v-else>
    <!-- <div id = "app" class="bg-green-300 h-full w-full">
      <section class="flex flex-col space-y-2">
        <h1>Detail &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button @click="disabled = !disabled" class="button">활성화</button></h1>
        <div>
          <label name="expiration">유통기한 :</label>
          <input type="date" id="start" name="trip-start" value="2021-08-29" :disabled="disabled">
        </div>
        <div>
          <label name="stockId">제품명:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
          <input type="text" name="stockId" v-model="stockId" :disabled="disabled"/>
        </div>
        <div>
          <label name="brandId">브랜드명 :</label>
            <select name="pets" id="pet-select" :disabled="disabled">
              <option v-for="( brand, i ) in brandList" :key="i">{{ brand }}</option>
            </select>
        </div>
        <div>
          <label name="stockCount">수량:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
          <input type="text" name="stockCount" v-model="stockCount" :disabled="disabled"/>
        </div>
        <div>
          <input
            type="button"
            class="submitBtn"
            value="등록"
            @click="inputStock"
          />
          <button class="submitBtn" id="cancelStock">취소</button>
        </div>
      </section>
    </div>
  </div> -->
</template>


<script>

export default {
  data() {
    return {
      expiration: "",
      stockId: "",
      brandId: "",
      stockCount: "",

      disabled: false,
      brandList: [ "Lotte", "Nongsim", "Samyang", "Ohttoogi", "Paldo" ],
      details: true,
    };
  },
  methods: {
    inputStock() {
      this.stockName = "";
      this.stockCount = "";
      this.brandId = "";
    },    
  },
};
// $('#actiivation').click(function() {
//   $('input').attr('disabled', 'disabled');
// });
</script>
<style scoped>
li {
  margin-bottom: 10px;
}
.submitBtn {
  background-color: skyblue;
  width: 150px;
  height: 50px;
  cursor: pointer;
  border-radius: 10px;
}

.button {background-color: #555555; color: white;}
</style>
