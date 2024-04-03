import { createRouter, createWebHistory } from 'vue-router'
import GraphicsView from '@/views/GraphicsView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: GraphicsView
    }
  ]
})

export default router
