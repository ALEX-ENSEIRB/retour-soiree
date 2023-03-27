<template>
    <div>
        <div class="comments" v-for="messages in trip.messages">
            {{ messages.content }}
        </div>
    </div>
</template>

<script setup>
const props = defineProps({
    trip: {
        type: Object,
        required: true
    }
})
</script>

<style >

</style>