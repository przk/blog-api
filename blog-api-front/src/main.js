// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import store from './store/modules/index.js'
import VueResource from 'vue-resource'
import BootstrapVue from 'bootstrap-vue/esm/'
// import VueAxios from 'vue-axios'
// import { securedAxiosInstance, plainAxiosInstance } from './backend/axios'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import axios from 'axios'

axios.defaults.baseURL = 'http://0.0.0.0:3000/api/v1/'
// axios.defaults.withCredentials = true

Vue.use(axios)
Vue.use(VueResource)
// Vue.use(VueAxios, {
//   secured: securedAxiosInstance,
//   plain: plainAxiosInstance
// })
Vue.use(BootstrapVue)
Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  // securedAxiosInstance,
  // plainAxiosInstance,
  components: { App },
  template: '<App/>'
})
