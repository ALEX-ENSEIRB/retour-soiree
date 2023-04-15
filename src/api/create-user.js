import axios from 'axios';
import API_URL  from './api-url.js';


const createUser = async (user) => {
    const response = await axios.post(await API_URL + "user/create_user.php", user).then((response) => {
        console.log(response);
        return response;
    }).catch((error) => {
        console.log(error);
        return error.response;
    })
    return response;
}

export default createUser;