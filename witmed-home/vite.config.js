import { fileURLToPath, URL } from 'node:url'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    vue(),
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  },
  // https: true,
  server: {
    proxy: {
      // 获取路径中包含'/api'的请求
      '/api': {
        // 后端服务器所在的源
        target: 'http://116.204.122.181:8077',
        // 修改源
        changeOrigin: true,
        secure: false,
        // 将'/api'替换为''
        rewrite: (path) => path.replace(/^\/api/, '')
      }
    }
  }
})
