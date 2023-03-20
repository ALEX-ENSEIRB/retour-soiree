import axios from 'axios';

const API_URL = await fetch('/src/config.json').then((response) => response.json()).then((json) => json.API_URL);

const  postTrip = (trip) => {
    return axios.post(API_URL + "post_trip.php", trip).then((response) => {
        return response.data;
    });
}

export default postTrip;