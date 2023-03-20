<template>
    <div class="main">
        <h2>UB'EIRB</h2>
        <p v-for="actor in data" :key="actor">
            {{actor.NOM}}
            {{actor.PRENOM}}
        </p>
        <div class="slogan">
            <div class="slogan_text">
                <h1>Avec Ub'eirb, vous n'avez plus à jongler avec les clés et l'alcootest.</h1>
                <p class="desc">Retour Soirée est une application qui permet de trouver des personnes qui souhaitent rentrer chez elles après une soirée. Cherchez un trajet qui vous convient en fonction de l'heure de départ et des zones desservies !</p>
            </div>
        </div>
        <div class="button_trip">
            <CreateRideButton />
            <SearchRideButton />
        </div>
            
    </div>
</template>

<script setup>
import axios from 'axios'
import { ref, onMounted } from 'vue';
import CreateRideButton from '../components/CreateRideButton.vue';
import SearchRideButton from '../components/SearchRideButton.vue';

const data = ref([])
const api_url = ref('')



</script>

<style>
.main{
    color: #fff;
    height: 100vh;
    display: flex;
    align-items: center;
    flex-direction: column;
}
.slogan{
    width: 60%;
    text-align: center;
    border-radius: 10px;
    
    background: rgb(2,0,36);
    background: linear-gradient(135deg, rgba(2,0,36,1) 0%, rgba(1,87,126,1) 31%, rgba(9,9,121,1) 135%);
    color: rgb(255, 255, 255);
    padding-left: 10%;
    padding-right: 10%;
    padding-top: 2%;
    padding-bottom: 2%;
}

.slogan_text{
    width: 100%;
    color: #fff;
    
}

.button_trip{
    width: 60%;
    display: flex;
    justify-content: space-between;
    margin: 20px;
    padding: 20px;
}
.desc{
    font-size: 1.3rem;
    color: #a0a0a0;
}

</style>