<template>
  <v-app id="inspire">
    <Header :title="app_title"/>
    <v-main>
      <v-container>
        <v-row>
          <v-col
            v-for="article in articles"
            :key="article.id"
            cols="4"
          >
          <ArticleList :article="article"/>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import ArticleList from "./components/ArticleList"
import Header from "./components/Header"
import axios from "axios"

export default {
  name: 'ArticleAPI',
  components: {
    ArticleList,
    Header
  },
  data: function () {
    return {
      app_title: "Image Memory",
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
