<template>
  <div class="posts_wrapper__list">
        <div class="posts_wrapper__list_wrap">
          <div class="post">
            <div class="post__top_box">
              <span class="post__top_box__name">
                投稿者:
              </span>
              <span class="post__top_box__time">
                投稿日時：{{ article.updated_at }}
              </span>
            </div>


            <div class="post__midle_box_title">
              タイトル: {{ article.title }}
            </div>

            <div class="post__under_box_admin">

            </div>
          </div>
        </div>

    <div class="posts_wrapper__list_paginate">

    </div>

  </div>

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
