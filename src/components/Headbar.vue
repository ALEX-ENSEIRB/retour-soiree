<template>
    <div class="headbar">
        <div class="home">
            <router-link class="link" to="/">Accueil</router-link>
        </div>    
        <div class="createride">
            <router-link class="link" to="/create-ride">Créer Trajet</router-link>
            <router-link class="link" to="/search-ride">Rechercher Trajet</router-link>
            <router-link class="link" to="/historic">Historique</router-link>
            <router-link class="link" to="/connect">Se connecter</router-link>
        </div>
        
        <!-- <router-link ></router-link> -->
    </div>
</template>

<script setup>

</script>

<style>
    .headbar{
        display: flex;
        justify-content: space-between;
        background-color: #000;
        color: #fff;
        padding: 10px;
        text-decoration: none;
        margin: 10px;
    }

    .link{
        color: #fff;
        text-decoration: none;
        margin: 10px;
    }
    

</style>