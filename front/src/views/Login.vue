<template>
    <div class="vue-tempalte">
        <form>
            <h3>Se connecter</h3>
            <div class="form-group">
                <label for="email">Adresse E-mail </label>
                <input
                    required
                    v-model="email"
                    type="email"
                    name="email"
                    id="email-input"
                    class="form-control form-control-lg"/>
            </div>
            <div class="form-group">
                <label for="password">Mot de passe</label>
                <input
                    required
                    v-model="password"
                    type="password"
                    name="password"
                    id="password-input"
                    class="form-control form-control-lg"/>
            </div>
            <button type="submit" class="btn btn-dark btn-lg btn-block"  @click.prevent="buttonLogin">
            Se connecter</button>
            <p class="forgot-password text-right mt-2 mb-4">
                <router-link to="/forgot-password">Mot de passe oublié ?</router-link>
            </p>
            <div class="social-icons">
                <ul>
                    <li><a href="#"><i class="fa fa-google"></i></a></li>
                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                </ul>
            </div>
        </form>
    </div>
</template>
<script>
import axios from "axios";
export default {
  data() {
    return {
      token: "",
      userId: "",
      email: "",
      password: "",
    };
  },
  methods: {
    async buttonLogin() {
      await axios
        .post("http://localhost:3000/api/user/login", {
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