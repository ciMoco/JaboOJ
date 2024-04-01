import { createApp } from "vue";
import ArcoVue from "@arco-design/web-vue";
import "@arco-design/web-vue/dist/arco.css";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import ArcoVueIcon from "@arco-design/web-vue/es/icon";

import "@/plugins/axios";
import "@/access";
import "bytemd/dist/index.css";

createApp(App)
  .use(ArcoVue)
  .use(store)
  .use(router)
  .use(ArcoVueIcon)
  .mount("#app");
