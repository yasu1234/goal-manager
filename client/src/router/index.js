import { createRouter, createWebHistory } from 'vue-router';
import Home from '/src/components/Home.vue';
import SignUp from '/src/components/SignUp.vue';
import Login from '/src/components/Login.vue';
import GoalManager from '/src/components/GoalManager.vue';
import GoalAdd from '/src/components/GoalAdd.vue';
import RegisterComplete from '/src/components/RegisterComplete.vue';
import TaskAdd from '/src/components/TaskAdd.vue';
import GoalList from '/src/components/GoalList.vue';

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
  {
    path: '/login', 
    name: 'Login', 
    component: Login,
  },
  {
    path: '/goalManager', 
    name: 'GoalManager', 
    component: GoalManager,
    children: [
      { path: '/goalAdd', name:'GoalAdd', component: GoalAdd },
      { path: '/goalComplete', name: 'RegisterComplete', component: RegisterComplete},
      { path: '/taskAdd', name: 'TaskAdd', component: TaskAdd},
      { path: '/goalList', name: 'GoalList', component: GoalList}
    ]
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;