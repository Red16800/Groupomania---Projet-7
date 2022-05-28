<template>
  <div class="vue-tempalte">
     <form>
    <h1>MON PROFIL</h1>
    <div id="container">
<!-- ICI ajouter de quoi afficher les posts du profil -->
      <div class="les-Posts">
        <h3>Mes Posts</h3>
        <cardPost
          :key="post.id"
          v-for="post of posts"
          :title="post.title"
          :content="post.content"
          :user="post.User"
          :image="post.image"
          :id="post.id"
        />
      </div>
      <div id="profil">
        <!-- Email et pseudo du profil -->
        <div v-if="dataProfile">
          <p>E-mail :{{ " " + dataProfile.email }}</p>
          <p>
            Prénom et Nom :
            {{ dataProfile.firstname + " " + dataProfile.lastname }}
          </p>
          <hr />
        </div>
        <div v-else id="chargement">
          Chargement
          <span></span>
          <span></span>
          <span></span>
        </div>
        <!-- modification pseudo et email du profil -->
        <form method="post" @submit.prevent="updateProfile">
          <div>
            <label for="lastname">Nom</label><br />
            <input
              required
              v-model="lastname"
              type="text"
              name="lastName"
              id="lastname-input"
              class="form-control form-control-lg"/>
            <label for="firstname">Prénom</label><br />
            <input
              required
              v-model="firstname"
              type="text"
              name="firstname"
              id="firstname-input"
              class="form-control form-control-lg"/>
          </div>


          <button class="btn btn-dark btn-lg btn-block" type="submit" @click.prevent="updateProfile">Modifier</button>
          <p v-if="message">{{ message }}</p>
        </form>
        <hr />
        <!-- Supprimer le profil -->
        <button class="btn btn-dark btn-lg btn-block" type="submit" @click.prevent="deleteProfile">
          Supprimer mon compte
        </button>
      </div>
    </div>
    </form>
  </div>
</template>

<script>
import axios from "axios";
import cardPost from "../components/cardPost";
export default {
  name: "profile",
  components: {
    cardPost,
  },
  props: {
    id: Number,
  },
  data() {
    return {
      token: "",
      userId: "",
      message: "",
      dataProfile: null,
      posts: [],
      email: "",
      firstname: "",
      lastname: "",
    };
  },
  methods: {
    loadProfile() {
      let userId = localStorage.getItem("id");
      axios
        .get("http://localhost:3000/api/user/profile/" + userId)
        .then((res) => {
          this.dataProfile = res.data;
        })
        .catch((error) => {
          console.log({ error });
          if (error.status === 401) {
            this.$router.push("/login");
          }
        });
    },
    allPostsProfile() {
      let userId = localStorage.getItem("id");
      axios
        .get("http://localhost:3000/api/user/profile/" + userId + "/posts")
        .then((res) => {
          this.posts = res.data;
        })
        .catch((error) => {
          console.log({ error });
          if (error.status === 401) {
            this.$router.push("/login");
          }
        });
    },
    updateProfile() {
      let userId = localStorage.getItem("id");
      const data = {
        firstname: this.firstname,
        lastname: this.lastname,
      };
      axios
        .put("http://localhost:3000/api/user/profile/" + userId, data)
        .then((res) => {
          alert("Votre profil a bien été mis à jour !");
          this.dataProfile = res.data.user;
        })
        .catch((error) => {
          this.error = error;
          if (error.status === 401) {
            this.$router.push("/login");
          }
        });
    },
    async deleteProfile() {
      const isConfirm = await confirm(
        "Confirmez vous la suppression du profil ?"
      );
      console.log({ isConfirm });
      if (!isConfirm) {
        return;
      }
      let userId = localStorage.getItem("id");
      axios
        .delete("http://localhost:3000/api/user/profile/" + userId)
        .then(() => {
          alert("Votre compte est supprimé !");
          this.$router.push("/signup");
        })
        .catch((error) => {
          console.log({ error });
          alert("Le profil n'a pas pu être supprimé !");
        });
    },
  },
  mounted() {
    /*appeler les fonctions quand l'html sera pret*/
    this.loadProfile();
    this.allPostsProfile();
  },
};
</script>