<template >
  <div v-if="!loading" class="allPost" >
    <h3 class="titleActu">Fil d'actualité...</h3>
    <card-post
      :key="post.id"
      v-for="post of posts"
      :title="post.title"
      :content="post.content"
      :user="post.User"
      :image="post.image"
      :id="post.id"
    />
  </div>
</template>

<script>
import axios from "axios";
import cardPost from "./cardPost";
export default {
  name: "allPosts",
  components: { cardPost },
  data() {
    return {
      posts: [],
      loading: false,
    };
  },
  methods: {
    async fetchPosts() {
      this.loading = true;
      try {
        const { data } = await axios.get("/api/post");
        this.posts = data;
      } catch (error) {
        if (error.status === 401) {
          this.$router.push("/login");
        }
      }
      this.loading = false;
    },
  },
  mounted() {
    this.fetchPosts();
  },
};
</script>
<style scoped>
img {
  max-width: 60%;
}
</style>