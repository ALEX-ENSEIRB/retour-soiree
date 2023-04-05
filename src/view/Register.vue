<template>
    <div class="create_ride_container">
        <h1>Inscription</h1>
        <div id="errors">

        </div>
        <div class="w-2/3 flex center flex-col create_ride_form">
            <div class="address flex justify-between ">
                <div class="address_start form_input w-2/5">
                    <div class="name">
                        <label class="label_name">
                            Nom
                        </label>
                        <input v-model="name"
                            class="w-full bg-gray-300 text-gray-700 border rounded py-3 px-4 focus:outline-none focus:border-green-500"
                            id="grid-first-name" type="text" placeholder="Guillemot">
                    </div>
                    <div class="address_end form_input w-2/5">
                        <div class="firstname">
                            <label class="label_firstname">
                                Prénom
                            </label>
                            <input v-model="firstname"
                                class="w-full bg-gray-300 text-gray-700 border  rounded py-3 px-4 focus:outline-none focus:border-green-500"
                                id="grid-first-name" type="text" placeholder="Julien">
                        </div>
                    </div>
                    <div class="address_end form_input w-2/5">
                        <div class="firstname">
                            <label class="label_firstname">
                                Date de naissance
                            </label>
                            <input v-model="firstname"
                                class="w-full bg-gray-300 text-gray-700 border  rounded py-3 px-4 focus:outline-none focus:border-green-500"
                                id="grid-first-name" type="date" placeholder="">
                        </div>
                    </div>

                </div>
                <div class="address_end form_input w-2/5">
                    <div class="firstname">
                        <label class="label_firstname">
                            Adresse électronique
                        </label>
                        <input v-model="firstname"
                            class="w-full bg-gray-300 text-gray-700 border  rounded py-3 px-4 focus:outline-none focus:border-green-500"
                            id="grid-first-name" type="text" placeholder="exemple.email@exemple.fr">
                    </div>
                    <div class="address_end form_input w-2/5">
                        <div class="firstname">
                            <label class="label_firstname">
                                Numéro de téléphone
                            </label>
                            <input v-model="firstname"
                                class="w-full bg-gray-300 text-gray-700 border  rounded py-3 px-4 focus:outline-none focus:border-green-500"
                                id="grid-first-name" type="text" placeholder="ex: 06 66 66 66 66">
                        </div>
                    </div>
                    <div class="address_end form_input w-2/5">
                        <div class="firstname">
                            <label class="label_firstname">
                                Lieu de résidence
                            </label>
                            <input v-model="firstname"
                                class="w-full bg-gray-300 text-gray-700 border  rounded py-3 px-4 focus:outline-none focus:border-green-500"
                                id="grid-first-name" type="text" placeholder="3 Rue de L'exemple, 33130 Bègles">
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="connex">
                    <button class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">
                        S'Inscrire
                    </button>
                   
                
            </div>
        </div>
    </div>
</template>

<script setup>
import { onMounted, ref } from 'vue';

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

    if(startingZone.value === null) {
        createError('Veuillez choisir une zone de départ');
    }
    if(endingZone.value === null) {
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
#errors{
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