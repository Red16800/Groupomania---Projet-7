<template>
    <div class="vue-tempalte">
        <form>
            <h3>Créer un compte</h3>
            <div class="form-group">
                <label>Pseudo</label>
                <input type="text" class="form-control form-control-lg"/>
            </div>
            <div class="form-group">
                <label>Adresse E-mail </label>
                <input type="email" class="form-control form-control-lg" />
            </div>
            <div class="form-group">
                <label>Mot de passe</label>
                <input type="password" class="form-control form-control-lg" />
            </div>
            <button type="submit" class="btn btn-dark btn-lg btn-block">Créer un compte</button>
            <p class="forgot-password text-right">
                Déjà enregistré
                <router-link :to="{name: 'login'}">se connecter?</router-link>
            </p>
        </form>
    </div>
</template>
<script>
    export default {
        data() {
            return {}
        }
    }
</script>