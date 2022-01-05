import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import './index.css'

/** FontAwesome setting  */
import { library } from '@fortawesome/fontawesome-svg-core'
import { fas } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

library.add(fas)

Vue.component('font-awesome-icon', FontAwesomeIcon)

/** /FontAwesome setting  */

import LoadingPlugin from '@/plugins/LoadingPlugin.js'
Vue.use(LoadingPlugin)

// https://github.com/avil13/vue-sweetalert2
import VueSweetalert2 from 'vue-sweetalert2'
import 'sweetalert2/dist/sweetalert2.min.css'
Vue.use(VueSweetalert2)

Vue.config.productionTip = false

new Vue({
  router,
  // vues store : 데이터저장창고
  // https://www.koatech.info/blog/vuex-basis/
  store,
  render: (h) => h(App),
}).$mount('#app')
