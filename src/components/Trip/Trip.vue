<template>
    <div class="container_trip my-4 overflow-y-hidden" :id="trip.id">
        <div class="info_trip">
            <p>De : {{ trip.depart }}</p>
            <p>A : {{ trip.arrivee }}</p>
            <p>Depart : {{ toTime(trip.departTime) }} {{ toDate(trip.departTime) }}
            </p>
            <p>Nombre de places : {{ trip.nbPlaces }}</p>
            <SeeRideButton @click="seeRide" :status="tripStatus" />
        </div>
        <div class="vl"></div>
        <div class="drive_comment">
            <p>Conducteur : {{ trip.driver.firstname }} {{ trip.driver.name }}</p>
            <div v-if="isJoinable()">
                <div class="join-ride-button">
                    <button class="join-ride-button__button" @click="joinTripHandler">
                        <span class="join-ride-button__button__text">S'inscrire au Trajet</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import SeeRideButton from '../SeeRideButton.vue';
import { ref, onMounted } from 'vue';
import { joinTrip } from '../../api/join-trip.js';

const tripStatus = ref(false)

const isJoinable = () => {
    if (props.fromSearch && localStorage.getItem('user')) {
        return true
    } else {
        return false
    }
}

const toTime = (oldTime) => {
    const date = new Date(oldTime);
    return date.toLocaleTimeString('fr-FR', { hour: '2-digit', minute: '2-digit' });
}

const toDate = (oldDate) => {
    const date = new Date(oldDate);
    return date.toLocaleDateString('fr-FR');
}

const seeRide = () => {
    tripStatus.value = !tripStatus.value
    const trip = document.getElementById(props.trip.id)
    trip.classList.toggle('active')
}

const props = defineProps({
    trip: {
        type: Object,
        required: true
    },
    fromSearch: {
        type: Boolean,
        required: true
    }
})

const joinTripHandler = async () => {
    const trip = {
        trip_id: props.trip.id,
        user_id: JSON.parse(localStorage.getItem('user')).id
    }
    await joinTrip(trip);
}

</script>

<style>
.container_trip {
    background-color: #fff;
    border-radius: 10px;
    width: 50%;
    display: flex;
    justify-content: center;
    margin: 20px;
    /*padding: 20px;*/
    color: #000;
}

.info_trip {
    display: flex;
    flex-direction: column;
    align-items: center;

}

.active {
    width: 100%;
    min-height: 50%;
    justify-content: space-between;
    /* transition */
    transition: all 0.5s ease-in-out;
}

.drive_comment {
    display: none;
}

.active .drive_comment {
    display: block;
    width: 45%;
}

.active .info_trip {
    width: 45%;
}

.vl {
    display: none;
    max-height: 0%;
    transition: all 0.5s ease-in-out;
}

.active .vl {
    border-left: 6px solid #000;
    max-height: 100%;
    display: block;
}

.join-ride-button {
    display: flex;
    justify-content: center;
    margin-top: 20px;
    margin-bottom: 20px;

}

.join-ride-button__button {
    background: rgb(81, 96, 172);
    background: radial-gradient(circle, rgba(81, 96, 172, 1) 0%, rgba(20, 62, 124, 0.756827731092437) 135%);
    border: none;
    border-radius: 0.5rem;
    box-shadow: 0 0 0.5rem rgba(0, 0, 0, 0.25);
    cursor: pointer;
    transition: all 0.2s ease-in-out;
    width: 220px;
    height: 60px;
}

.join-ride-button__button:hover {
    transform: scale(1.1);
}

.join-ride-button__button__text {
    font-size: 1.5rem;
    font-weight: 700;
    color: #fff;
}
</style>