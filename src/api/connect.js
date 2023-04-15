import axios from 'axios';
import API_URL  from './api-url.js';


const connectUser = async (user) => {
    const response = await axios.post(await API_URL + "user/connect_user.php", user).then((response) => {
        console.log(response);
        return response;
    }).catch((error) => {
        console.log(error);
        return error;
    })
    return response;
}

export default connectUser;