// 路由配置

import { createRouter, createWebHistory } from 'vue-router'


const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    { path: '/', redirect: '/login' },
    { path: '/login', component: () => import('@/components/login/Login.vue') },
    {
      path: '/home',
      component: () => import('@/components/home/Home.vue'),
      redirect: '/home/mainPage',
      children: [
        { path: 'mainPage', component: () => import('@/components/home/mainPage/MainPage.vue')},
        { path: 'medicineBox', component: () => import('@/components/home/medicineBox/MedicineBox.vue') },
        { path: 'doctorAppointment', component: () => import('@/components/home/doctorAppointment/DoctorAppointment.vue') },
        { path: 'personalPanel/:id', component: () => import('@/components/home/personalPanel/PersonalPanel.vue') },
      ]
    },
    { path: '/admin', component: () => import('@/components/admin/admin.vue') },
    { path: '/test', component: () => import('@/components/test/ApiTest.vue') },
    { path: '/mqttTest', component: () => import('@/components/test/MqttTest.vue') },
  ]
})

export default router
