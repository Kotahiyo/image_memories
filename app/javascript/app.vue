<template>
  <div id="app">
    <p>{{ message }}</p>
    <template v-for="article in articles">
      <ArticleList :key="article.id" v-bind:article="article"/>
    </template>

    <v-btn
      elevation="2"
      outlined
    > ボタンだよ</v-btn>
  </div>
</template>

<script>
import ArticleList from "./components/ArticleList"
import axios from "axios"

export default {
  name: 'ArticleAPI',
  components: {
    ArticleList
  },
  data: function () {
    return {
      message: "Image Memory",
      articles: [],
    }
  },
  async created(){
    try {
      const response = await axios.get('http://localhost:3000/api/v1/posts')
      this.articles = response.data
      console.log(response.data);
    } catch (error) {
      const res = error.response
      console.log(res);
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
