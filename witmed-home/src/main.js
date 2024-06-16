import '@/assets/css/global.css'
import '@/assets/css/cmpt.css'
import '@/assets/css/theme.css'

import { createApp } from 'vue'

// Pinia
import { createPinia } from 'pinia'
import { createPersistedState } from 'pinia-persistedstate-plugin'

// ElementPlus
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'

// Data-v
// https://datav-vue3.netlify.app/Guide/Guide.html
import DataVVue3 from '@kjgl77/datav-vue3'

// Particles
// import Particles from 'vue3-particles'

import App from './App.vue'
import router from './router/router.js'

const app = createApp(App)
const pinia = createPinia()

// Pinia持久化配置
const persist = createPersistedState()
pinia.use(persist)

app.use(ElementPlus)

// ElementPlus Icons 全局导入
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
  app.component(key, component)
}

app.use(DataVVue3)
app.use(pinia)
// app.use(Particles)
app.use(router)

app.mount('#app')
