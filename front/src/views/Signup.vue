<template>
  <div class="vue-tempalte">
    <form>
      <h3>Créer un compte</h3>
      <div class="form-group">
        <label for="firstname">Prénom :</label>
        <input required v-model="firstname" type="text" name="firstName" id="firstname-input" 
          class="form-control form-control-lg" />
        <label for="lastname">Nom :</label>
        <input required v-model="lastname" type="text" name="lastName" id="lastname-input"  class="form-control form-control-lg" />
      </div>
      <div class="form-group">
        <label for="email">Adresse E-mail </label>
        <input required v-model="email" type="email" name="email" id="email-input"
          class="form-control form-control-lg" />
      </div>
      <div class="form-group">
        <label for="password">Mot de passe</label>
        <input required v-model="password" type="password" name="password" id="password-input"
          class="form-control form-control-lg" />
      </div>
      <button type="submit" class="btn btn-dark btn-lg btn-block" @click.prevent="buttonSignup">
        Créer un compte</button>
      <p class="forgot-password text-right">
        Déjà enregistré
        <router-link :to="{ name: 'login' }">se connecter?</router-link>
      </p>
    </form>
  </div>
</template>
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
        const res = await axios.post("http://localhost:3000/api/user/signup", data);
        console.log(res);
        this.$router.push("/login");
      } catch (error) {
        alert(error?.response?.data?.error || "Une erreur est survenue.");
      }
    },
  },
};
</script>