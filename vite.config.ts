import { defineConfig, loadEnv } from 'vite';
import react from '@vitejs/plugin-react';
import path from 'path';

// https://vitejs.dev/config/
export default defineConfig(({ mode }) => {
  const env = loadEnv(mode, process.cwd(), '');
  return {
    plugins: [react()],
    resolve: {
      alias: {
        '@': path.resolve('.', './src'),
        '@hello-pangea/dnd': path.resolve('.', './node_modules/@hello-pangea/dnd')
      },
    },
    define: {
      'import.meta.env.VITE_API_BASE': JSON.stringify(env.VITE_API_BASE)
    },
    build: {
      rollupOptions: {
        external: ['@capgo/capacitor-social-login']
      }
    }
  }
});

