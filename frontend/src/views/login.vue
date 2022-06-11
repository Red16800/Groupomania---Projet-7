<template>
  <div class="container_login">
    <h2>Bienvenue sur votre réseau social d'entreprise</h2>
    <h3>Connexion</h3>

    <form class="login" @submit.prevent="login">
      <label for="email">Email :</label>
      <input
        required
        v-model="email"
        type="email"
        name="email"
        id="email-input"
      />

      <label for="password">Mot de passe :</label>
      <input
        required
        v-model="password"
        type="password"
        name="password"
        id="password-input"
      />

      <button type="submit" @click.prevent="buttonLogin">Se connecter</button>
      <p v-if="message">{{ message }}</p>
    </form>

    <div class="container_signup">
      <p>
        Vous n'avez pas de compte?
        <router-link to="/signup">Créer un compte</router-link>.
      </p>
    </div>
  </div>
</template>
//----------------------------------------------------------------------------------------------------------------------
<script>
import axios from "axios";
export default {
  data() {
    return {
      token: "",
      userId: "",
      email: "",
      password: "",
      message: "",
    };
  },
  methods: {
    async buttonLogin() {
      await axios
        .post("/api/auth/login", {
          email: this.email,
          password: this.password,
        })
        .then((res) => {
          {
            localStorage.setItem("token", res.data.token);
            localStorage.setItem("id", res.data.userId);
            localStorage.setItem("isAdmin", res.data.isAdmin);
          }
          this.$router.push("/profile");
        })
        .catch((error) => {
          alert("Authentification incorrect");
          this.error = error;
        });
    },
  },
};
</script>
//----------------------------------------------------------------------------------------------------------------------
<style scoped>
.container_login {
  display: flex;
  margin-left: auto;
  margin-right: auto;
  flex-direction: column;
  box-shadow: 0px 0px 10px 0px grey;
  margin-top: 50px;
  width: 50%;
  background-color: white;
  border-radius: 20px;
}
.login {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.login input {
  width: 500px;
  margin-bottom: 15px;
  max-width: 50%;
  border-style: solid;
  border-color: #fd2d01;
  background-color: #ffd7d7;
  border-radius: 10px;
}
.login button {
  width: 150px;
  cursor: pointer;
  border: unset;
  font-size: 1.2em;
  box-shadow: 5px 5px 15px -3px rgba(0, 0, 0, 0.5);
  background: #fd2d01;
  margin-top: 40px;
  margin-bottom: 60px;
  transition: 0.3s;
  color: white;
  font-weight: bold;
  border-radius: 20px;
  height: 40px;
}
.login button:hover {
  transform: scale(1.1);
}
.container_signup {
  margin-top: 10px;
  box-shadow: 0px 0px 10px 0px grey;
}
</style>