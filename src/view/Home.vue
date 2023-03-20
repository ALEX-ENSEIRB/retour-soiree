<template>
    <div class="main">
        <h2>RETOUR SOIREE</h2>
        <p v-for="actor in data" :key="actor">
            {{ actor.NOM }}
            {{ actor.PRENOM }}
        </p>

    </div>
</template>

<script setup>
import axios from 'axios'
import { ref, onMounted } from 'vue';

const data = ref([])
const api_url = ref('')




</script>

<style>
.main {
    color: #fff;
    height: 100vh;
    display: flex;
    align-items: center;
    flex-direction: column;
    overflow-y: scroll;
}

.slogan {
    width: 75%;
    height: 100%;
    padding: 20px;
    margin: auto;
    background-image: linear-gradient(135deg, #02065aee, #024775ee);
    background-color: initial;
    border-radius: 50px;
}
</style>