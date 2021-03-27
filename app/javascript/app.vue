<template>
  <v-app id="inspire">
    <v-app-bar
      app
    >
      <v-app-bar-nav-icon></v-app-bar-nav-icon>

      <v-toolbar-title> {{ app_title }} </v-toolbar-title>

      <v-spacer></v-spacer>

      <v-btn icon>
        <v-icon>mdi-dots-vertical</v-icon>
      </v-btn>
    </v-app-bar>

    <v-main>
      <v-container>
        <v-row>
          <v-col
            v-for="article in articles"
            :key="article.id"
            cols="4"
          >
            <v-card height="150" shaped>
              <v-card-title>投稿者:</v-card-title>
              <v-card-subtitle>投稿日時：{{ article.updated_at }}</v-card-subtitle>
              <v-card-text>
                {{ article.title }}
              </v-card-text>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
// import ArticleList from "./components/ArticleList"
import axios from "axios"

export default {
  name: 'ArticleAPI',
  // components: {
  //   ArticleList
  // },
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
