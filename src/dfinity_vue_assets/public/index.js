// import learning_4 from 'ic:canisters/learning_4';

// learning_4.greet(window.prompt("Enter your name:")).then(greeting => {
//   window.alert(greeting);
// });


import Vue from 'vue';
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import App from './App.vue';
// import VueRouter from 'vue-router'
// import router from './router'

// Vue.use(VueRouter)
console.log("index.js")


Vue.use(ElementUI);

new Vue({
  el: '#app',
  render: h => h(App)
});
