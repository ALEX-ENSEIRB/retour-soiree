<template>
    <div class="main">
        <h2>Rechercher un Trajet</h2>
        <div class="searchbar">
            <div class="search">
                <select
                    class="box"
                    name="" id="" v-model="startingZone">
                    <option v-for="zone in zones" :key="zone.ID_ZONE">
                        {{ zone.NOM_ZONE }}
                    </option>
                </select>
                <select
                    class="box"
                    name="" id="" v-model="endingZone">
                    <option v-for="zone in zones" :key="zone.ID_ZONE">
                        {{ zone.NOM_ZONE }}
                    </option>
                </select>
                <input class="box" type="datetime-local" placeholder="Date" v-model="depart_time"/>
                <input class="box" type="number" placeholder="Nombre de places" v-model="nb_places" min="1" max="10" />
                <input class="bsearch" type="submit" placeholder="Rechercher" v-on:click="search()"/>
            </div> 
        </div>
        
    </div>
</template>

<script setup>
import { onMounted, reactive, ref } from 'vue';
import {searchTrip, searchZones}  from '../api/search-trip.js';

const address_start = ref('')
const address_end = ref('')
const nb_places = ref(1)
const depart_time = ref('')
// const zones = ref([])

const selectedEvent = ref(null)
const startingZone = ref(null)
const endingZone = ref(null)

const newTrip = ref({})

let zones = reactive([])

onMounted(async () => {
    console.log('mounted')
    await searchZones().then((result) => {
        result.forEach(element => {
            zones.push(element)
        });
    })
    console.log(zones)
    await searchTrip().then((result) => {
        result.forEach(element => {
            console.log(element)
        });
    })
})

const search = () => {
    console.log('search')
    console.log(startingZone.value)
    // createTrip()
}

const createTrip = () => {

    newTrip.value = {
        
         address_start: {
            address: address_start.value,
            zone: startingZone.value
        },
        address_end: {
            address: address_end.value,
            zone: endingZone.value
        },
        nb_places: nb_places.value,
        depart_time: depart_time.value,
    }
    if (selectedEvent.value !== null) {
        newTrip.value.event = selectedEvent.value
    }
    console.log(newTrip.value)
    postTrip(newTrip)
}

const events = ref([
    {
        id: null,
        name: 'Aucun'
    },
    {
        id: 1,
        name: 'Event 1'
    },
    {
        id: 2,
        name: 'Event 2'
    },
    {
        id: 3,
        name: 'Event 3'
    },
    {
        id: 4,
        name: 'Event 4'
    },
    {
        id: 5,
        name: 'Event 5'
    }
])

</script>

<style>
    .main{
        color: #fff;
        height: 100vh;
        display: flex;
        align-items: center;
        flex-direction: column;
    }

    .searchbar{
        display: flex;
        justify-content: center;
        margin-top: 20px;
        margin-bottom: 20px;
        color: rgb(0, 0, 0);
        background: rgb(2,0,36);
        background: linear-gradient(135deg, rgba(2,0,36,1) 0%, rgba(1,87,126,1) 31%, rgba(9,9,121,1) 135%);
        width: 80%;
        height: 7%;
        border-radius: 10px;
    }
    .search{
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 100%;
    }
    .box{
        width: 18%;
        border-radius: 10px;
        border: none;
        margin-left: 10px;
        margin-right: 10px;
        padding-left: 10px;
        padding-right: 10px;
        background: white;
    }

    .bsearch{
        width: 10%;
        border-radius: 10px;
        border: none;
        margin-left: 10px;
        margin-right: 10px;
        padding-left: 10px;
        padding-right: 10px;
        background-color: #ffffff;
        color: rgb(0, 0, 0);
        text-align: center;
    }
</style>