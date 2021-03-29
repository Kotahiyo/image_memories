<template>
  <v-row>
    <v-col
      v-for="article in articles"
      :key="article.id"
      cols="4"
    >
      <v-card height="200" shaped>
        <v-card-title>投稿者:</v-card-title>
        <v-card-subtitle>投稿日時：{{ article.updated_at }}</v-card-subtitle>
        <v-card-text>
          {{ article.title }}
        </v-card-text>
        <v-card-actions>
          <v-btn color="pink lighten-2" class="white--text font-weight-bold"> 削除 </v-btn>
          <v-btn color="blue lighten-1" class="white--text font-weight-bold"> 編集 </v-btn>
          <v-btn
            color="orange lighten-1"
            class="white--text font-weight-bold"
            @click="moveShow(article.id)"
          >
            <router-link :to="{name: 'PostShow', params: { id: article.id }}">詳細</router-link>
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-col>

  </v-row>

</template>

<script>
import axios from "axios"
export default {
  props: {
    article: {
      type: Object,
      default: null
    }
  },
  data: function () {
    return {
      articles: [],
    }
  },
  methods: {
    moveShow: function(id) {
      this.$router.push(`/posts/${id}`)
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
