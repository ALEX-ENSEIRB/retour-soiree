import axios from 'axios';
import API_URL  from './api-url.js';


const createTrip = async (trip) => {
    const data = await axios.post(await API_URL + "trip/create_trip.php", trip).then((response) => {
        console.log(response.data);
        return response.data;
    })
    return data;
}

export default createTrip;