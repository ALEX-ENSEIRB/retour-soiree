import { createRouter, createWebHistory } from 'vue-router';
import Home from '../view/Home.vue';
import CreateRide from '../view/CreateRide.vue';
import SearchRide from '../view/SearchRide.vue';
import Historic from '../view/Historic.vue';
import Connect from '../view/Connect.vue';
import Register from '../view/Register.vue';
import User from '../Helper/User.js';

const routes = [
    {
        path: '/',
        name: 'Home',
        component: Home
    },
    {
        path: '/create-ride',
        name: 'CreateRide',
        beforeEnter: async (to, from) => {
            const isConnected = User.isConnected();
            if (!isConnected) {
                return { name: "Home" };
            }
        },
        component: CreateRide,
    },
    {
        path: '/search-ride',
        name: 'SearchRide',
        component: SearchRide,
    },
    {
        path: '/historic',
        name: 'Historic',
        beforeEnter: async (to, from) => {
            const isConnected = User.isConnected();
            if (!isConnected) {
                return { name: "Home" };
            }
        },
        component: Historic,
    },
    {
        path: '/connect',
        name: 'Connect',
        component: Connect,
    },   
    {
        path: '/register',
        name: 'Register',
        component: Register,
    }
];

const router = createRouter({
    history: createWebHistory(),
    routes
});

export default router;