import axios from 'axios';

const API_URL = await fetch('/conf.json').then(async (response) => {
    const responseJson = await response.json().then((json) => {
        return json.api_url
    })
    return responseJson;
});


const createUser = async (user) => {
    const data = await axios.post(API_URL + "create_user.php", user).then((response) => {
        console.log(response.data);
        return response.data;
    })
    return data;
}

export default createUser;