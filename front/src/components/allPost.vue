<template>
  <div v-if="!loading" id="allPost">
    <h3 class="title">Liste des posts</h3>
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
  <div v-else id="chargement">
    chargement
    <span></span>
    <span></span>
    <span></span>
  </div>
</template>
//----------------------------------------------------------------------------------------------------------------------
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
        const { data } = await axios.get("http://localhost:3000/api/post");
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
