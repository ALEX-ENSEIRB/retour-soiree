import axios from 'axios';
import API_URL  from './api-url.js';

const searchTrip = async () => {
    const response = await axios.get(await API_URL + "trip/search_trip.php");
    return response.data;
}
const searchZones = async () => {
    const response = await axios.get(await API_URL + "zones/search_zone.php");
    return response.data;
}



export { searchTrip, searchZones };