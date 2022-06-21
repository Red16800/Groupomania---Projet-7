<template>
  <div class="test">
    <h2>{{ title }}</h2>
    <p>{{ content }}</p>
    <div>
      <router-link :to="`/post/${id}`">
        <img :src="image" />
      </router-link>
    </div>
    <router-link :to="`/post/${id}`">Commentaires ...</router-link>
  </div>
</template>

<script>
export default {
  props: ["title", "content", "user", "id", "image"],
};
</script>

<style scoped>
img {
  max-width: 60%;
}
</style>