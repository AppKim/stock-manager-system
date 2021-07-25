<template>
  <div class="w-full h-full">
    <div class="mx-auto w-96 h-60">
      <div class="flex flex-col justify-center items-center">
        <font-awesome-icon
          :icon="['fas', 'user']"
          size="2x"
          class="text-primary my-2 hover:text-lighter"
        ></font-awesome-icon>
        <h1 class="text-xl mb-2 font-bold">Login</h1>
      </div>
      <section class="flex flex-col w-full space-y-3">
        <input type="text" placeholder="Email" />
        <input type="password" placeholder="Password" />
        <button
          class="w-full h-12 text-white bg-primary rounded-full hover:bg-dark"
        >
          <span>Sign In</span>
        </button>
        <div class="flex flex-col w-full text-center">
          <router-link to="/register">
            New to Here? Create an account
          </router-link>
          <router-link to="/"> use as a guest? </router-link>
        </div>
      </section>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
export default Vue.extend({});
</script>

<style scoped>
input {
  background: #fff;
  border: 1px solid #a6a6a6;
  border-radius: 3px;
  font-size: 1rem;
  line-height: 1;
  min-height: 50px;
  padding: 10px;
}
input:focus {
  outline: none;
  border: none;
  box-shadow: var(--tw-ring-inset) 0 0 0 calc(4px + var(--tw-ring-offset-width))
    var(--tw-ring-color);
}
</style>
