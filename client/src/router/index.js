import { createRouter, createWebHistory } from 'vue-router';
import Home from '/src/components/Home.vue';
import SignUp from '/src/components/SignUp.vue';


const routes = [
  {
    path: '/', 
    name: 'Home', 
    component: Home,
  },
  {
    path: '/signUp', 
    name: 'SignUp', 
    component: SignUp,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;