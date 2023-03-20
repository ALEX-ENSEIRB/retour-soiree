<template>
    <div class="main">
        <h2>Rechercher un Trajet</h2>
        <div class="searchbar">
            <div class="search">
                <input class="box" type="text" placeholder="Départ" />
                <input class="box" type="text" placeholder="Arrivée" />
                <input class="box" type="text" placeholder="Date" />
                <input class="box" type="text" placeholder="Heure" />
                <input class="box" type="text" placeholder="Nombre de places" />
                <button class="bsearch">Rechercher</button>
            </div>
        </div>
    
    </div>
</template>

<script setup>
</script>

<style>
    .main{
        color: #fff;
        height: 100vh;
        display: flex;
        align-items: center;
        flex-direction: column;
    }

    .searchbar{
        display: flex;
        justify-content: center;
        margin-top: 20px;
        margin-bottom: 20px;
        color: white;
        background: rgb(2,0,36);
        background: linear-gradient(135deg, rgba(2,0,36,1) 0%, rgba(1,87,126,1) 31%, rgba(9,9,121,1) 135%);
        width: 80%;
        height: 7%;
        border-radius: 10px;
        padding-top: 20px;
    }
    .box{
        width: 14%;
        height: 50%;
        border-radius: 10px;
        border: none;
        margin-left: 10px;
        margin-right: 10px;
        padding-left: 10px;
        padding-right: 10px;
    }
    .bsearch{
        width: 10%;
        height: 50%;
        border-radius: 10px;
        border: none;
        margin-left: 10px;
        margin-right: 10px;
        padding-left: 10px;
        padding-right: 10px;
        background-color: #ffffff;
        color: rgb(0, 0, 0);
    }
</style>