<template class="block">
  <div class="inner-block">
    
    <h1>PROFIL :</h1>
    <div >
      <div >
        <!-- Email, Nom et prénom du profil -->
        <div v-if="dataProfile">
          <p>{{ " " + dataProfile.email }}</p>
          <p>
            {{ dataProfile.firstname + " " + dataProfile.lastname }}
          </p>
          <hr />
        </div>
        <!-- modification Nom et prénom du profil -->
        <form method="post" @submit.prevent="updateProfile">
          <div>
            <label for="lastname">Nom</label><br />
            <input
              required
              v-model="lastname"
              type="text"
              name="lastName"
              id="lastname-input"
              class="form-control form-control-lg"
            />
          </div>
          <div>
            <label for="firstname">Prénom</label><br />
            <input
              required
              v-model="firstname"
              type="text"
              name="firstname"
              id="firstname-input"
              class="form-control form-control-lg"
            />
          </div>
            <br>
          <button type="submit" class="btn btn-success btn-lg btn-block" @click.prevent="updateProfile">Modifier</button>
          <p v-if="message">{{ message }}</p>
        </form>
        <hr />
      
        <button class="btn btn-danger btn-lg btn-block" type="submit" @click.prevent="deleteProfile">
          Supprimer mon compte
        </button>
      </div>
    </div>
    <br>
  </div>
</template>

<script>
import axios from "axios";
export default {
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
        .get("/api/auth/profile/" + userId)
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
        .get("/api/auth/profile/" + userId + "/posts")
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
        .put("/api/auth/profile/" + userId, data)
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
        .delete("/api/auth/profile/" + userId)
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
    this.loadProfile();
    this.allPostsProfile();
  },
};
</script>
