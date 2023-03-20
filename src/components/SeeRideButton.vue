<template>
    <div>
        <div class="see-ride-button">
            <button class="see-ride-button__button" @click="seeRide">
                <span class="see-ride-button__button__text">Voir Trajet</span>
            </button>
        </div>
    </div>
</template>

<script setup>

</script>

<style>
    .see-ride-button {
        display: flex;
        justify-content: center;
        margin-top: 20px;
        margin-bottom: 20px;
        
    }

    .see-ride-button__button {
        background: rgb(81,96,172);
        background: radial-gradient(circle, rgba(81,96,172,1) 0%, rgba(20,62,124,0.756827731092437) 135%);
        border: none;
        border-radius: 0.5rem;
        box-shadow: 0 0 0.5rem rgba(0, 0, 0, 0.25);
        cursor: pointer;
        transition: all 0.2s ease-in-out;
        width: 220px;
        height: 60px;
    }

    .see-ride-button__button:hover {
        transform: scale(1.1);
    }

    .see-ride-button__button__text {
        font-size: 1.5rem;
        font-weight: 700;
        color: #fff;
    }
</style>