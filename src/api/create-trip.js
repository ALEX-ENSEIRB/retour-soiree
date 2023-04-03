import axios from 'axios';

const API_URL = await fetch('/src/config.json').then((response) => response.json()).then((json) => json.API_URL);

const  createRide = async (trip) => {
    const response = await axios.post(API_URL + "create_ride.php", trip);
    return response.data;
}

export default createRide;


