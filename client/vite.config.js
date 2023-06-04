import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import axios from 'axios'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue()],
  server: {
	proxy: {
		'^/api': {
		  target: process.env.VITE_APP_API_BASE,
		  changeOrigin: true,
		},
	  },
	},
})
