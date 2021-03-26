<template>
  <div id="app">
    <p>{{ message }}</p>
    <ArticleList/>
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
      message: "Hello Vue!",
      article: null,
    }
  },
  created: function(){
    axios.get('http://localhost:3000/api/v1/posts')
    .then(function(response){
      console.log(response.data);
    })
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
