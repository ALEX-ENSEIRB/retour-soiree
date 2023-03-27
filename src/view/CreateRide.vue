<template>
    <div class="create_ride_container">
        <h1>Créer un trajet</h1>
        <div id="errors">

        </div>
        <div class="w-2/3 flex center flex-col create_ride_form">
            <div class="address flex justify-between ">
                <div class="address_start form_input w-2/5">
                    <div class="address_content mb-5">
                        <label class="block uppercase text-white-700 text-xs font-bold mb-2">
                            Address de départ
                        </label>
                        <input v-model="address_start"
                            class="w-full bg-gray-300 text-gray-700 border rounded py-3 px-4 focus:outline-none focus:border-green-500"
                            id="grid-first-name" type="text" placeholder="3 Rue de L'exemple, 33130 Bègles">
                    </div>
                    <div class="address_zone">
                        <label class="block uppercase text-white-700 text-xs font-bold mb-2">
                            Zone de départ
                        </label>
                        <select
                            class="w-full bg-gray-300 text-gray-700 border rounded py-3 px-4 focus:outline-none focus:border-green-500"
                            name="" id="" v-model="startingZone">
                            <option v-for="zone in zones" :value="zone" :key="zone.id">
                                {{ zone.name }}
                            </option>
                        </select>
                    </div>
                </div>
                <div class="address_end form_input w-2/5">
                    <div class="address_content mb-5">
                        <label class="block uppercase text-white-700 text-xs font-bold mb-2">
                            Address d'arrivée
                        </label>
                        <input v-model="address_end"
                            class="w-full bg-gray-300 text-gray-700 border  rounded py-3 px-4 focus:outline-none focus:border-green-500"
                            id="grid-first-name" type="text" placeholder="3 Rue de L'exemple, 33130 Bègles">
                    </div>
                    <div class="address_zone">
                        <label class="block uppercase text-white-700 text-xs font-bold mb-2">
                            Zone d'arrivée
                        </label>
                        <select
                            class="w-full bg-gray-300 text-gray-700 border  rounded py-3 px-4 focus:outline-none focus:border-green-500"
                            name="" id="" v-model="endingZone">
                            <option v-for="zone in zones" :value="zone" :key="zone.id">
                                {{ zone.name }}
                            </option>
                        </select>
                    </div>
                </div>

            </div>
            <div class="nb_places form_input flex flex-col items-center ">
                <label class="block uppercase text-white-700 text-xs font-bold mb-2">
                    Nombre de places
                </label>
                <input v-model="nb_places"
                    class="w-1/3 bg-gray-300 text-gray-700 border rounded py-3 px-4 focus:outline-none focus:border-green-500"
                    id="grid-first-name" type="number" placeholder="3" min="1" max="10">
            </div>
            <div class="depart_time form_input flex flex-col items-center">
                <label class="block uppercase text-white-700 text-xs font-bold mb-2">
                    Heure de départ
                </label>
                <input v-model="depart_time"
                    class="w-1/3 bg-gray-300 text-gray-700 border rounded py-3 px-4 focus:outline-none focus:border-green-500"
                    id="grid-first-name" type="datetime-local">
            </div>
            <div class="events flex flex-col items-center form_input">
                <label class="block uppercase text-white-700 text-xs font-bold mb-2">
                    Associé un evenement
                </label>
                <select
                    class="w-1/3 bg-gray-300 text-gray-700 border  rounded py-3 px-4 focus:outline-none focus:border-green-500"
                    name="" id="" v-model="selectedEvent">
                    <option v-for="event in events" :value="event" :key="event.id">
                        {{ event.name }}
                    </option>
                </select>
            </div>
            <div class="submit_group flex justify-center  form_input">
                <button @click="createTrip"
                    class="w-1/3 submit bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 border border-green-700 rounded">
                    Créer
                </button>
            </div>
        </div>
    </div>
</template>

<script setup>
import { onMounted, ref } from 'vue';
// import {postTrip} from '../api/create-trip';

const address_start = ref('')
const address_end = ref('')
const nb_places = ref(1)
const depart_time = ref('')

const selectedEvent = ref(null)
const startingZone = ref(null)
const endingZone = ref(null)

const newTrip = ref({})

const createTrip = () => {
    clearErrors()

    if (startingZone.value === null) {
        createError('Veuillez choisir une zone de départ');
    }
    if (endingZone.value === null) {
        createError('Veuillez choisir une zone d\'arrivée');
    }

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

const clearErrors = () => {
    const errors = document.querySelector('#errors')
    errors.innerHTML = ''
}

const createError = (content) => {
    const errors = document.querySelector('#errors')
    const error = document.createElement('p')
    error.classList.add('text-red-500', 'italic')
    error.textContent = content;

    errors.appendChild(error)
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

const zones = ref([
    {
        id: 1,
        name: 'Zone 1'
    },
    {
        id: 2,
        name: 'Zone 2'
    },
    {
        id: 3,
        name: 'Zone 3'
    },
    {
        id: 4,
        name: 'Zone 4'
    },
    {
        id: 5,
        name: 'Zone 5'
    }
])

</script>

<style>
#errors {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    margin-bottom: 10px;
}

.create_ride_container {
    display: flex;
    flex-direction: column;
    align-items: center;
    height: 100vh;
    width: 100vw;

}

.create_ride_container h1 {
    margin: 20px;
    font-size: 2em;
    font-weight: bold;
}

.form_input {
    margin-bottom: 20px;
}
</style>