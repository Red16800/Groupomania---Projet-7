import { createRouter, createWebHistory } from "vue-router";

const routes = [
  {
    path: "/",
    name: "wall",
    component: () => import("../views/wall.vue"),
  },
  {
    path: "/signup",
    name: "signup",
    component: () => import("../views/signup.vue"),
  },
  {
    path: "/login",
    name: "login",
    component: () => import("../views/login.vue"),
  },
  {
    path: "/profile",
    name: "profile",
    component: () => import("../views/profile.vue"),
  },
  {
    path: "/post/:id",
    name: "post",
    component: () => import("../views/onePost.vue"),
  },
];
const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;