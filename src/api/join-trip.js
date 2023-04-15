import axios from 'axios';
import API_URL  from './api-url.js';


const joinTrip = async (trip) => {
    const response = await axios.post(await API_URL + "trip/join_trip.php", trip).then((response) => {
        console.log(response.data);
        return response.data;
    })
    return response;
}

export { joinTrip };