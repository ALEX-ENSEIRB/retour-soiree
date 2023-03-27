<template>
    <div class="historic">
        <h2 class="titre">Historique</h2>
        <div class="historic_text">
            <p>Vous pouvez retrouver ici l'historique de vos trajets</p>
        </div>
        <HistoricTrip v-for="trip in mockTrips" :trip="trip" />
    </div>
</template>

<script setup>
import axios from 'axios'
import { ref, onMounted } from 'vue';
import HistoricTrip from '../components/Historic/HistoricTrip.vue'

const mockTrips = [
    {
        id: 1,
        departTime: new Date(),
        departAddress: '1 rue de la paix',
        arrivalTime: new Date(),
        arrivalAddress: '1 rue de la paix',
        nb_places: 3,
        driver: {
            id: 1,
            name: 'Jean',
            firstname: 'Dupont',
            email: '',
        },
        messages: [
            {
                id: 1,
                content: 'Bonjour',
                date: new Date(),
                user: {
                    id: 1,
                    name: 'Jean',
                    firstname: 'Dupont',
                    email: '',
                }
            },
            {
                id: 2,
                content: 'Bonjour',
                date: new Date(),
                user: {
                    id: 1,
                    name: 'Jean',
                    firstname: 'Dupont',
                    email: '',
                }
            },
            {
                id: 3,
                content: 'Bonjour',
                date: new Date(),
                user: {
                    id: 1,
                    name: 'Jean',
                    firstname: 'Dupont',
                    email: '',
                }
            },
        ]
    }

]

</script>

<style>
.historic {
    color: #fff;
    height: 100vh;
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