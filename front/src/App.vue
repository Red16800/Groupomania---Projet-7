<template>
  <div >
    <!-- Navigation -->
    <nav class="navbar shadow bg-white rounded justify-content-between flex-nowrap flex-row fixed-top">
      <div class="container">
        <a class="navbar-brand float-left" href="/" >
         <img class="logo" src="./assets/logo-color.png" alt="Logo Groupomania">
        </a>
        <ul class="nav navbar-nav flex-row float-right">
          <li class="nav-item">
            <router-link class="nav-link pr-3" to="/">Accueil &nbsp;</router-link>
          </li>
           <li class="nav-item">
            <router-link class="nav-link pr-2" to="/profile">Profil &nbsp;</router-link>
          </li>
          <li class="nav-item">
             <a to="/" v-on:click="Logout()">
            <span class="btn btn-outline-primary">Déconnexion</span></a>
          </li>
        </ul>
      </div>
    </nav>
  </div>
    <!-- Main -->
    <div class="App" >
      <div class="vertical-center">
        <div>
          <router-view />
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