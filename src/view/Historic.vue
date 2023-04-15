<template>
    <div class="historic p-3">
        <h2 class="titre">Historique</h2>
        <div class="historic_text">
            <p>Vous pouvez retrouver ici l'historique de vos trajets</p>
        </div>
        <Trip v-for="trip in trips" :trip="trip" />
    </div>
</template>

<script setup>
import { reactive, onMounted } from 'vue';
import Trip from '../components/Trip/Trip.vue'
import { searchTrip } from '../api/search-trip.js';

let trips = reactive([])


onMounted(async () => {
    await searchTrip().then((result) => {
        result.forEach(element => {
            //if userid in localhost is the same as the driver id, then add the trip to the list
            if (element.driver.id == JSON.parse(localStorage.getItem('user')).id) {
                trips.push(element)
            }
        });
    })
})
</script>

<style>
.historic {
    color: #fff;
    display: flex;
    align-items: center;
    flex-direction: column;
}

.historic_text {
    width: 60%;
    text-align: center;
    border-radius: 10px;
    background: rgb(2, 0, 36);
    background: linear-gradient(135deg, rgba(2, 0, 36, 1) 0%, rgba(1, 87, 126, 1) 31%, rgba(9, 9, 121, 1) 135%);
    padding: 10px;
    margin: 2%;
}

.titre,
p {
    font-size: 1.3rem;
    text-align: center;
}
</style>