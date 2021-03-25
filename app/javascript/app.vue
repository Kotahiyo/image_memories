<template>
  <div id="app">
    <p>{{ message }}</p>
    <ArticleList/>
  </div>
</template>

<script>
import ArticleList from "./components/ArticleList"
export default {
  components: {
    ArticleList
  },
  data: function () {
    return {
      message: "Hello Vue!"
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
