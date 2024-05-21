import { fileURLToPath, URL } from 'node:url'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import path from 'node:path';

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
  server: {
    proxy: {
      "api/v1": {
        target: "http://127.0.0.1/api/v1",
        ws: true,
        changeOrigin: true,
        rewrite: (path) => path.replace("/api/v1","")
      }
    }
  }
});
