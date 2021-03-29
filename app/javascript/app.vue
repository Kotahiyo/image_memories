<template>
  <v-app id="inspire">
    <Header :title="app_title"/>
    <v-main>
      <v-container>
        <div class="nav">
          <router-link to="/">一覧画面</router-link>
        </div>
          <router-view/>
      </v-container>
    </v-main>

  </v-app>
</template>

<script>
import Header from "./components/Header"

export default {
  name: 'ArticleAPI',
  components: {
    Header,
  },
  data: function () {
    return {
      app_title: "Image Memory",
    }
  },
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
