import Vue from "vue";
import Router from "vue-router";

import PostList from "../components/PostList";
import PostShow from "../components/PostShow";

Vue.use(Router);

const router = new Router({
  mode: "history",
  routes: [
    {
      path: "/",
      component: PostList,
    },
    {
      path: "/posts/:id",
      name: "PostShow",
      component: PostShow,
    },
  ],
});
export default router;
