<template>
    <div class="main">
        <h2>RETOUR SOIREE</h2>
        <p v-for="actor in data" :key="actor">
            {{actor.NOM}}
            {{actor.PRENOM}}
        </p>
    </div>
</template>

<script setup>
import axios from 'axios'
import { ref, onMounted } from 'vue';

const data = ref([])
const api_url = ref('')


onMounted(async () => {
    await fetch("../../conf.json").then(res => res.json()).then(res => {
    api_url.value = res.api_url
    console.log(api_url.value)})    

    await axios.get(api_url.value + 'get_actors.php').then(res => {
        data.value = res.data
        console.log(data.value)
    })
})



</script>

<style>
.main{
    color: #fff;
    height: 100vh;
    display: flex;
    align-items: center;
    flex-direction: column;
}
</style>