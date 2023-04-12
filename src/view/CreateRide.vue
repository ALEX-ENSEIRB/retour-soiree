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
                        <input v-model="data.address_start"
                            class="w-full bg-gray-300 text-gray-700 border rounded py-3 px-4 focus:outline-none focus:border-green-500"
                            id="grid-first-name" type="text" placeholder="3 Rue de L'exemple, 33130 Bègles">
                    </div>
                    <div class="address_zone">
                        <label class="block uppercase text-white-700 text-xs font-bold mb-2">
                            Zone de départ
                        </label>
                        <select
                            class="w-full bg-gray-300 text-gray-700 border rounded py-3 px-4 focus:outline-none focus:border-green-500"
                            name="" id="" v-model="data.startingZone">
                            <option v-for="zone in zones" :key="zone.ID_ZONE" :value="zone.ID_ZONE">
                                {{ zone.NOM_ZONE }}
                            </option>
                        </select>
                    </div>
                </div>
                <div class="address_end form_input w-2/5">
                    <div class="address_content mb-5">
                        <label class="block uppercase text-white-700 text-xs font-bold mb-2">
                            Address d'arrivée
                        </label>
                        <input v-model="data.address_end"
                            class="w-full bg-gray-300 text-gray-700 border  rounded py-3 px-4 focus:outline-none focus:border-green-500"
                            id="grid-first-name" type="text" placeholder="3 Rue de L'exemple, 33130 Bègles">
                    </div>
                    <div class="address_zone">
                        <label class="block uppercase text-white-700 text-xs font-bold mb-2">
                            Zone d'arrivée
                        </label>
                        <select
                            class="w-full bg-gray-300 text-gray-700 border  rounded py-3 px-4 focus:outline-none focus:border-green-500"
                            name="" id="" v-model="data.endingZone">
                            <option v-for="zone in zones" :key="zone.ID_ZONE" :value="zone.ID_ZONE">
                                {{ zone.NOM_ZONE }}
                            </option>
                        </select>
                    </div>
                </div>

            </div>
            <div class="nb_places form_input flex flex-col items-center ">
                <label class="block uppercase text-white-700 text-xs font-bold mb-2">
                    Nombre de places
                </label>
                <input v-model="data.nb_places"
                    class="w-1/3 bg-gray-300 text-gray-700 border rounded py-3 px-4 focus:outline-none focus:border-green-500"
                    id="grid-first-name" type="number" placeholder="3" min="1" max="10">
            </div>
            <div class="depart_time form_input flex flex-col items-center">
                <label class="block uppercase text-white-700 text-xs font-bold mb-2">
                    Heure de départ
                </label>
                <input v-model="data.depart_time"
                    class="w-1/3 bg-gray-300 text-gray-700 border rounded py-3 px-4 focus:outline-none focus:border-green-500"
                    id="grid-first-name" type="datetime-local">
            </div>
            <div class="events flex flex-col items-center form_input">
                <label class="block uppercase text-white-700 text-xs font-bold mb-2">
                    Associé un evenement
                </label>
                <select
                    class="w-1/3 bg-gray-300 text-gray-700 border  rounded py-3 px-4 focus:outline-none focus:border-green-500"
                    name="" id="" v-model="data.selectedEvent">
                    <option v-for="event in events" :key="event.ID_EVENT">
                        {{ event.NOM_EVENT }}
                    </option>
                </select>
            </div>
            <div class="submit_group flex justify-center  form_input">
                <button @click="createTripHandler"
                    class="w-1/3 submit bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 border border-green-700 rounded">
                    Créer
                </button>
            </div>
        </div>
    </div>
</template>

<script setup>
import { onMounted, ref, reactive } from 'vue';
import createTrip from '../api/create-trip.js';
import router from '../router/index.js';
import { searchZones } from '../api/search-trip.js';
import { searchEvent } from '../api/search-event.js';

const data = reactive({
    address_start: '',
    address_end: '',
    nb_places: 1,
    depart_time: '',
    selectedEvent: null,
    startingZone: null,
    endingZone: null,
})

let zones = reactive([])
let events = reactive([])

const createTripHandler = async () => {
    clearErrors()
    let hasError = false;
    if (data.startingZone === null) {
        createError('Veuillez choisir une zone de départ');
        hasError = true;
    }
    if (data.endingZone === null) {
        createError('Veuillez choisir une zone d\'arrivée');
        hasError = true;
    }

    if (hasError) {
        return;
    }
    const formData = new FormData();
    formData.append('address_start', data.address_start);
    formData.append('address_end', data.address_end);
    formData.append('id_zone_start', parseInt(data.startingZone));
    formData.append('id_zone_end', parseInt(data.endingZone));

    
    formData.append('nb_places', data.nb_places);
    formData.append('date_trajet', data.depart_time);
    if (data.selectedEvent !== null) {
        formData.append('event', data.selectedEvent.id);
    }
    
    await createTrip(formData);
    router.push('/')
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
onMounted(async () => {
    console.log('mounted')
    await searchZones().then((result) => {
        result.forEach(element => {
            zones.push(element)
        });
    })
    console.log(zones)
    await searchEvent().then((result) => {
        result.forEach(element => {
            events.push(element)
        });
    })
    console.log(events)
})


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