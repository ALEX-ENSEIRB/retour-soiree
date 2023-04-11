<template>
    <div class="connect_container">
        <h1>Se connecter</h1>
        <div id="errors">

        </div>
        <div class="w-2/3 flex center flex-col create_ride_form">
            <div class="address flex justify-between ">
                <div class="address_start form_input w-2/5">
                    <div class="address_content mb-5">
                        <label class="block uppercase text-white-700 text-xs font-bold mb-2">
                            Mail
                        </label>
                        <input v-model="data.email"
                            class="w-full bg-gray-300 text-gray-700 border rounded py-3 px-4 focus:outline-none focus:border-green-500"
                            type="text" placeholder="">
                            <a href="" class="text-white-700 text-xs font-bold mb-2">Identifiant oublié?</a>
                    </div>
                    
                </div>
                <div class="address_end form_input w-2/5">
                    <div class="address_content mb-5">
                        <label class="block uppercase text-white-700 text-xs font-bold mb-2">
                            Mot de passe
                        </label>
                        <input v-model="data.password"
                            class="w-full bg-gray-300 text-gray-700 border  rounded py-3 px-4 focus:outline-none focus:border-green-500"
                            type="password" placeholder="">
                            <a href="" class="text-white-700 text-xs font-bold mb-2">Mot de passe oublié?</a>
                    </div>
                    
                </div>
            </div>
            <div class="connex">
                    <button class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded"
                    v-on:click="connectHandler()">
                        Se connecter
                    </button>
                   
                
            </div>
            <router-link class="link-register" to="/register" >Pas encore inscrit?</router-link>
            
        </div>
    </div>
</template>

<script setup>
import { onMounted, ref, reactive } from 'vue';
import connectUser from '../api/connect.js';
import router from '../router/index.js';

onMounted(() => {
    if (localStorage.getItem('connected') === 'true') {
        router.push('/');
    }
});

let data = reactive({
    email: '',
    password: ''
});

const connectHandler = async () => {
    clearErrors()
    let hasError = false;
    if (data.email === '') {
        createError('Veuillez renseigner votre email');
        hasError = true;
    }
    if (data.password === '') {
        createError('Veuillez renseigner votre mot de passe');
        hasError = true;
    }
    if (hasError) {
        return;
    }

    const formData = new FormData();
    formData.append('email', data.email);
    formData.append('password', data.password);

    const response = await connectUser(formData);
    if(response.status === 200){
        localStorage.setItem('connected', true);
        window.location.href = '/'; //need to refresh page because header has to be remounted
    }
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

</script>

<style>
#errors{
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    margin-bottom: 10px;
}

.connect_container {
    display: flex;
    flex-direction: column;
    align-items: center;
    height: 100vh;
    width: 100vw;

}

.connect_container h1 {
    margin: 20px;
    font-size: 2em;
    font-weight: bold;
}

.form_input {
    margin-bottom: 20px;
}
.connex{
    display: flex;
    justify-content: center;
    margin-top: 20px;
}
.link-register{
    margin-top: 20px;
    color: #fff;
    text-decoration: underline;
    text-align: center;
}
</style>