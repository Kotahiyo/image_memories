<template>
  <v-app-bar
  app
  >
    <v-app-bar-nav-icon></v-app-bar-nav-icon>

    <v-toolbar-title> {{ title }} </v-toolbar-title>

    <v-spacer></v-spacer>
    <v-btn>
      新規登録
    </v-btn>
    <v-spacer></v-spacer>

    <v-btn icon>
      <v-icon>fas fa-search</v-icon>
    </v-btn>
  </v-app-bar>
</template>

<script>
export default {
  props: {
    title: {
      type: String,
      default: null
    }
  }
}
</script>
