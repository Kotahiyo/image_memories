<template>
  <v-card height="200" shaped>
    <v-card-title>投稿者:</v-card-title>
    <v-card-subtitle>投稿日時：{{ article.updated_at }}</v-card-subtitle>
    <v-card-text>
      {{ article.title }}
    </v-card-text>
    <v-card-actions>
      <v-btn color="pink lighten-2" class="white--text font-weight-bold"> 削除 </v-btn>
      <v-btn color="blue lighten-1" class="white--text font-weight-bold"> 編集 </v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
  props: {
    article: {
      type: Object,
      default: null
    }
  }
}
</script>
