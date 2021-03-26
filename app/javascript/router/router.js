import Vue from "vue";
import Router from "vue-router";

import ArticleList from "../components/ArticleList";

Vue.use(Router);

const router = new Router({
  mode: "history",
  routes: [
    {
      path: "/",
      component: ArticleList,
    },
  ],
});
export default router;
