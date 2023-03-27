<template>
    <div class="container_trip" :id="trip.id">
        <div class="info_trip">
            <p>Depart : {{ trip.departTime.toLocaleTimeString('fr-FR') }} {{ trip.departTime.toLocaleDateString('fr-FR') }}
            </p>
            <p>Arrivée : {{ trip.arrivalTime.toLocaleTimeString('fr-FR') }} {{ trip.arrivalTime.toLocaleDateString('fr-FR')
            }}</p>
            <p>Nombre de places : 3</p>
            <SeeRideButton @click="seeRide" />
        </div>
        <div class="vl"></div>
        <div class="drive_comment">
            <p>Conducteur : {{ trip.driver.firstname }} {{ trip.driver.name }}</p>
            <div v-if="isFinished()">
                <TripComments :trip="trip"/>
            </div>
            <div v-else>
                <TripMessages />
            </div>
        </div>
    </div>
</template>

<script setup>
import SeeRideButton from '../SeeRideButton.vue';
import TripComments from './TripComments.vue';
import TripMessages from './TripMessages.vue';

const seeRide = () => {
    console.log('seeRide')
    const trip = document.getElementById(props.trip.id)
    trip.classList.toggle('active')
    console.log(trip)
}

const props = defineProps({
    trip: {
        type: Object,
        required: true
    }
})

const isFinished = () => {

    console.log(props.trip.messages)
    if(props.trip.arrivalTime == null || props.trip.arrivalTime == undefined || isNaN(props.trip.arrivalTime)){
        return false
    }
    return props.trip.arrivalTime < new Date()
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
    max-height: 30%;
}

.info_trip {
    display: flex;
    flex-direction: column;
    align-items: center;

}

.active {
    width: 100%;
    height: 100%;
    max-height: 100%;
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
</style>