<template>
  <div class="container_signup">
    <h2>Bienvenue sur votre réseau social d'entreprise</h2>
    <h3>Merci de remplir le formulaire d'inscription</h3>

    <form class="signup" @submit.prevent="signup">
      <label for="firstname">Prénom :</label>
      <input
        required
        v-model="firstname"
        type="text"
        name="firstName"
        id="firstname-input"
      />

      <label for="lastname">Nom :</label>
      <input
        required
        v-model="lastname"
        type="text"
        name="lastName"
        id="lastname-input"
      />

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

      <button type="submit" @click.prevent="buttonSignup">S'inscrire</button>
      <p v-if="message">{{ message }}</p>
    </form>

    <div class="container_login">
      <p>
        Vous avez déjà un compte? <router-link to="/login">Se connecter</router-link>.
      </p>
    </div>
  </div>
</template>
//----------------------------------------------------------------------------------------------------------------------
<script>
import axios from "axios";
export default {
  name: "signup",
  data() {
    return {
      firstname: "",
      lastname: "",
      email: "",
      password: "",
      message: "",
    };
  },
  methods: {
    async buttonSignup() {
      const data = {
        firstname: this.firstname,
        lastname: this.lastname,
        email: this.email,
        password: this.password,
      };
      console.table(data);
      try {
        const res = await axios.post("/api/auth/signup", data);
        console.log(res);
        this.$router.push("/login");
      } catch (error) {
        alert(error?.response?.data?.error || "Une erreur est survenue.");
      }
    },
  },
};
</script>
//----------------------------------------------------------------------------------------------------------------------
<style scoped>
.container_signup {
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
.signup {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.signup input {
  width: 500px;
  margin-bottom: 15px;
  max-width: 50%;
  border-style: solid;
  border-color: #fd2d01;
  background-color: #ffd7d7;
  border-radius: 10px;
}
.signup button {
  width: 120px;
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
.signup button:hover {
  transform: scale(1.1);
}
.container_login {
  margin-top: 10px;
  box-shadow: 0px 0px 10px 0px grey;
}
</style>