<template>
    <div>
        <div class="comments flex flex-col my-8 border-2 rounded-lg w-4/5 h-full" v-for="comment in trip.comments">
            <div class="commmentHeader flex justify-evenly ">
                <div class="commentAuthor w-1/3">
                    <div class="commentAuthorName">{{ comment.user.name }}</div>
                    <div class="commentAuthorFirstname">{{ comment.user.firstname }}</div>
                </div>
                <div class="commentDate w-2/4">{{ parseDate(comment.date) }}</div>
            </div>
            <div class="commentContent">
                <p>{{ comment.content }}</p>
            </div>
            <div class="rating">
                <div class="ratingStars flex">
                    note :
                    <div class="ratingStar" v-for="star in comment.note">
                        ⭐
                    </div>
                </div>
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