<template>
    <div class="main">
        <h2 class="titre">Historique</h2>
        <div class="slogan">
            <div class="slogan_text">
                <p>Vous pouvez retrouver ici l'historique de vos trajets</p>
            </div>
        </div>
        <div class="container_trip">
            <div class="info_trip">
                <h2 class="titre">Trajet 1</h2>
                <p>Depart : 12h00</p>
                <p>Arrivée : 13h00</p>
                <p>Nombre de places : 3</p>
                <p>Nombre de places restantes : 1</p>
                <p>Nombre de personnes ayant répondu : 2</p>
                <p>Nombre de personnes ayant confirmé : 1</p>
                <SeeRideButton />
            </div>
        </div>
    </div>
</template>

<script setup>
import axios from 'axios'
import { ref, onMounted } from 'vue';
import SeeRideButton from '../components/SeeRideButton.vue';
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
        color: rgb(22, 19, 19);
        padding-left: 10%;
        padding-right: 10%;
        padding-top: 2%;
        padding-bottom: 2%;
    }
    .container_trip{
        background-color: #fff;
        border-radius: 10px;
        width: 40%;
        display: flex;
        justify-content: center;
        margin: 20px;
        /*padding: 20px;*/
        color : #000;
    }
    .titre,p{
        font-size: 1.3rem;
        text-align: center;
    }
</style>