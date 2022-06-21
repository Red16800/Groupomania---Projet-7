<template>
    <div class="inner-block">
        <form>
            <h3>Se Connecter</h3>
 
            <div class="form-group">
                <label>Email : </label>
                <input
                  required
                  v-model="email"
                  type="email"
                  name="email"
                  id="email-input"
                  class="form-control form-control-lg"
                />
            </div>
 
            <div class="form-group">
                <label>Password</label>
                <input
                  required
                  v-model="password"
                  type="password"
                  name="password"
                  class="form-control form-control-lg"
                />
            </div>
 
            <button type="submit" class="btn btn-dark btn-lg btn-block" @click.prevent="buttonLogin">Se connecter</button>
            <p v-if="message">{{ message }}</p>
 
            <p class="forgot-password text-right mt-2 mb-4">
                <router-link to="/signup">Creer un compte?</router-link>
            </p>
 
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
          this.$router.push("/");
        })
        .catch((error) => {
          alert("Authentification incorrect");
          this.error = error;
        });
    },
  },
};
</script>