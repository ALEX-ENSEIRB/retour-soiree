<template>
    <div class="headbar">
        <div class="home">
            <router-link class="link" to="/">Accueil</router-link>
        </div>    
        <div class="createride">
            <router-link class="link" to="/create-ride">Créer Trajet</router-link>
            <router-link class="link" to="/search-ride">Rechercher Trajet</router-link>
            <router-link class="link" to="/historic">Historique</router-link>
            <router-link class="link" to="/connect" >Se connecter</router-link>
        </div>
    </div>
</template>

<script setup>

</script>

<style>
    .headbar{
        display: flex;
        justify-content: space-between;
        
        background: rgb(11,15,37);
        background: radial-gradient(circle, rgba(11,15,37,1) 0%, rgba(8,27,56,0.756827731092437) 135%);
        color: #fff;
        padding: 10px;
        text-decoration: none;
    }

    .link{
        color: #fff;
        text-decoration: none;
        margin: 10px;
    }
    

</style>