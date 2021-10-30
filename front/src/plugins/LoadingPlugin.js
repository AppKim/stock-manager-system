import Vue from 'vue'
import Loading from '@/components/common/Loading.vue'

Vue.component('Loading', Loading)

export default {
  install(Vue) {
    Vue.mixin({
      data() {
        return {
          isLoading: false,
        }
      },
    })
  },
}
