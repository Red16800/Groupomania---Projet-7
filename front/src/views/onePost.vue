<template>
  <div class="blocComment" >
    <div v-if="post" >
      <div class="le-post">
        <h1>{{ post.title }}</h1>
        <p>{{ post.content }}</p>
        <img :src="post.image" />
        <div>
          <button class="btn btn-danger btn-lg btn-block"
            v-if="post.idUser === me || isAdmin"
            @click.prevent="deletePost(post.id)"
          >
            Supprimer
          </button>
        </div>
        <new-comment  @refresh="refreshComments" :id="post.id"></new-comment>
      </div>
     
      <div class="comment">
        <h2>Commentaires :</h2>
      <div ref="comments">
        <div class="card" :key="comment.id" v-for="comment of comments">
          <p>
            {{ comment.comment }}
          </p>
          <p class="nameSuivie">
            {{ comment.User.firstName }} {{ comment.User.lastName }}
          </p>
          <div v-if="comment.User.id === me || isAdmin">
            <button class="btn btn-danger btn-lg btn-block" @click.prevent="deleteComment(comment.id)">
              Supprimer
            </button>
          </div>
          
        </div>
      </div>
      </div>
    </div>
    <div v-else>
      chargement...
    </div>
  </div>
</template>

<script>
import axios from "axios";
import newComment from "../components/newComment";
export default {
  name: "onePost",
  components: {
    newComment,
  },
  data() {
    return {
      post: null,
      comments: [],
      me: 0,
      isAdmin: false,
    };
  },
  methods: {
    async fetchPost() {
      try {
        const { data } = await axios.get("/api/post/" + this.$route.params.id);
        this.post = data;
      } catch (error) {
        console.log("error");
      }
    },
    async refreshComments() {
      await this.fetchComments();
      this.$refs.comments.scrollIntoView({
        behavior: "smooth",
      });
    },
    async fetchComments() {
      try {
        const { data } = await axios.get(
          "/api/post/" + this.$route.params.id + "/comments"
        );
        this.comments = data;
      } catch (error) {
        if (error.status === 401) {
          this.$router.push("/login");
        }
      }
    },
    async deleteComment(id) {
      console.log("delete comment id: ", id);
      const isConfirm = await confirm(
        "Confirmez vous la suppression du commentaire ?"
      );
      console.log({ isConfirm });
      if (!isConfirm) {
        return;
      }
      axios
        .delete("/api/post/" + this.$route.params.id + "/comment/" + id)
        .then(() => {
          alert("Votre commentaire a bien été supprimé !");
          document.location.reload();
        })
        .catch((error) => {
          console.log({ error });
        });
    },
    
    async deletePost(id) {
      console.log("delete post id: ", id);
      const isConfirm = await confirm(
        "Confirmez vous la suppression du post ?"
      );
      console.log({ isConfirm });
      if (!isConfirm) {
        return;
      }
      axios
        .delete("/api/post/" + this.$route.params.id)
        .then(() => {
          alert("Votre post a bien été supprimé !");
          this.$router.push("/");
        })
        .catch((error) => {
          console.log({ error });
        });
    },
  },
  mounted() {
    this.fetchPost();
    this.fetchComments();
    this.me = Number(localStorage.getItem("id"));
    this.isAdmin = localStorage.getItem("isAdmin") === "true";
  },
};
</script>
<style scoped>

img {
  max-width: 80%;
}

</style>