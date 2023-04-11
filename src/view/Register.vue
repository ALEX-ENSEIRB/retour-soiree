<template>
    <div class=" flex flex-col  items-center">
        <div class="w-3/4 flex flex-col">
            <h1>Inscription</h1>
            <div id="errors">
            </div>
            <div class="flex center justify-around">
                <div class="flex flex-col justify-between ">
                    <div class="form_input w-2/5">
                        <div>
                            <label>
                                Nom
                            </label>
                            <input v-model="data.name"
                                class="w-full bg-gray-300 text-gray-700 border rounded py-3 px-4 focus:outline-none focus:border-green-500"
                                type="text" placeholder="Guillemot">
                        </div>
                        <div>
                            <div>
                                <label>
                                    Prénom
                                </label>
                                <input v-model="data.firstname"
                                    class="w-full bg-gray-300 text-gray-700 border  rounded py-3 px-4 focus:outline-none focus:border-green-500"
                                    type="text" placeholder="Julien">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="flex flex-col">
                    <div class="form_input w-2/5">
                        <div>
                            <label>
                                Adresse électronique
                            </label>
                            <input v-model="data.email"
                                class="w-full bg-gray-300 text-gray-700 border  rounded py-3 px-4 focus:outline-none focus:border-green-500"
                                type="text" placeholder="exemple.email@exemple.fr">
                        </div>
                        <div>
                            <div>
                                <label>
                                    Mot de passe
                                </label>
                                <input v-model="data.password"
                                    class="w-full bg-gray-300 text-gray-700 border  rounded py-3 px-4 focus:outline-none focus:border-green-500"
                                    type="password" placeholder="ex: Mot de passe">
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div>
                        <label>
                            Numéro de téléphone
                        </label>
                        <input v-model="data.phone"
                            class="w-full bg-gray-300 text-gray-700 border  rounded py-3 px-4 focus:outline-none focus:border-green-500"
                            type="text" placeholder="ex: 06 06 06 06 06">
                    </div>
                </div>
            </div>
        </div>
        <div>
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
import router from '../router/index.js';

onMounted(() => {
    if (localStorage.getItem('connected') === 'true') {
        router.push('/');
    }
});

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
    if (data.name.length < 0) {
        createError('Veuillez choisir un nom valide');
        hasError = true;
    }
    if (data.firstname.length < 0) {
        createError('Veuillez choisir un prénom valide');
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
    const response = await createUser(formData);
    if (response.status === 201) {
        router.push('/connect');
    }else if (response.status === 409) {
        createError('Cette addresse email est déjà utilisée');
    }else {
        createError('Une erreur est survenue');
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
#errors {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    margin-bottom: 10px;
}

.form_input {
    margin-bottom: 20px;
}
</style>