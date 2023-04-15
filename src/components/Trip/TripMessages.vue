<template>
    <div>
        <div class="comments flex flex-col my-8 border-2 rounded-lg w-4/5 h-full" v-for="message in trip.messages">
            <div class="commmentHeader flex justify-evenly ">
                <div class="commentAuthor w-1/3 flex justify-evenly">
                    <div class="commentAuthorName">{{ message.user.name }}</div>
                    <div class="commentAuthorFirstname">{{ message.user.firstname }}</div>
                </div>
                <div class="commentDate w-2/4">{{ parseDate(message.date) }}</div>
            </div>
            <div class="commentContent">
                <p>{{ message.content }}</p>
            </div>
        </div>
    </div>
</template>

<script setup>
import { onMounted } from 'vue';

const props = defineProps({
    trip: {
        type: Object,
        required: true
    }
})

const parseDate = (date) => {
    //parse date with hours and minutes
    return date.toLocaleDateString('fr-FR', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' }) + ' à ' + date.toLocaleTimeString('fr-FR', { hour: '2-digit', minute: '2-digit' })
}
</script>

<style >

</style>