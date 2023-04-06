<template>
    <div class="create_ride_container">
        <h1>Inscription</h1>
        <div id="errors">

        </div>
        <div class="flex center create_ride_form justify-around">
            <div class="address flex flex-col justify-between ">
                <div class="address_start form_input w-2/5">
                    <div class="name">
                        <label class="label_name">
                            Nom
                        </label>
                        <input v-model="data.name"
                            class="w-full bg-gray-300 text-gray-700 border rounded py-3 px-4 focus:outline-none focus:border-green-500"
                            id="grid-first-name" type="text" placeholder="Guillemot">
                    </div>
                    <div class="address_end form_input w-2/5">
                        <div class="firstname">
                            <label class="label_firstname">
                                Prénom
                            </label>
                            <input v-model="data.firstname"
                                class="w-full bg-gray-300 text-gray-700 border  rounded py-3 px-4 focus:outline-none focus:border-green-500"
                                id="grid-first-name" type="text" placeholder="Julien">
                        </div>
                    </div>
                </div>
            </div>
            <div class="flex flex-col">
                <div class="address_end form_input w-2/5">
                    <div class="email">
                        <label class="label_email">
                            Adresse électronique
                        </label>
                        <input v-model="data.email"
                            class="w-full bg-gray-300 text-gray-700 border  rounded py-3 px-4 focus:outline-none focus:border-green-500"
                            id="grid-first-name" type="text" placeholder="exemple.email@exemple.fr">
                    </div>
                </div>
                <div class="password form_input w-2/5">
                    <div class="password">
                        <label class="label_password">
                            Mot de passe
                        </label>
                        <input v-model="data.password"
                            class="w-full bg-gray-300 text-gray-700 border  rounded py-3 px-4 focus:outline-none focus:border-green-500"
                            id="grid-first-name" type="password">
                    </div>
                </div>
                <div class="address_end form_input w-2/5">
                    <div class="phone">
                        <label class="label_phone">
                            Numéro de téléphone
                        </label>
                        <input v-model="data.phone"
                            class="w-full bg-gray-300 text-gray-700 border  rounded py-3 px-4 focus:outline-none focus:border-green-500"
                            id="grid-first-name" type="text" placeholder="ex: 06 66 66 66 66">
                    </div>
                </div>
            </div>
        </div>
        <div class="connection">
            <button class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded"
                v-on:click="createUserhandler()">
                S'Inscrire
            </button>
        </div>
    </div>
</template>

<script setup>
import { onMounted, ref, reactive } from 'vue';
import createUser from '../api/create-user';

const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

let data = reactive({
    name: '',
    firstname: '',
    email: '',
    phone: '',
    password: ''
});

const createUserhandler = async () => {
    clearErrors()
    let hasError = false;
    if (data.phone.length !== 10) {
        createError('Veuillez choisir un numéro valide');
        hasError = true;
    }
    if (emailRegex.test(data.email) === false) {
        createError('Veuillez choisir un email valide');
        hasError = true;
    }

    if (hasError) {
        return;
    }

    const formData = new FormData();
    formData.append('name', data.name);
    formData.append('firstname', data.firstname);
    formData.append('email', data.email);
    formData.append('phone', data.phone);
    formData.append('password', data.password);
    console.log(formData);
    const response = await createUser(formData);
    console.log(response);
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