import Vue from 'vue';
import App from './App.vue';

import VTooltip from 'v-tooltip';
Vue.use(VTooltip);

// import Vuetify from 'vuetify/lib'

// Vue.use(Vuetify)

// const opts = {}

// export default new Vuetify(opts)


Vue.config.productionTip = false;

new Vue({
  render: h => h(App),
}).$mount('#app');
