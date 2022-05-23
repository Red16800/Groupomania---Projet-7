<template>
  <div class="vue-tempalte">
    <!-- Navigation -->
    <nav class="navbar shadow bg-white rounded justify-content-between flex-nowrap flex-row fixed-top">
      <div class="container">
        <img class="logo-login" src="./assets/logo-groupo-color.png" alt="Logo Groupomania noire">
        <ul class="nav navbar-nav flex-row float-right">
          <li class="nav-item">
            <router-link class="nav-link pr-3" to="/login">Se connecter &nbsp;  &nbsp; </router-link>
          </li>
          <li class="nav-item">
            <router-link class="btn btn-outline-primary" to="/">Créer un compte</router-link>
          </li>
        </ul>
      </div>
    </nav>
    <!-- Main -->
    <div class="App">
      <div class="vertical-center">
        <div class="inner-block">
          <router-view />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  methods: {
    Logout() {
      localStorage.clear();
      this.$router.replace("/login");
    },
  },
};
</script>

<style>
@import './assets/css/main.css';
</style>