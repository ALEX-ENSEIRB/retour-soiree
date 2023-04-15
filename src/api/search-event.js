import axios from 'axios';
import API_URL  from './api-url.js';

const searchEvent = async (trip) => {
    const response = await axios.get(await API_URL + "event/search_event.php");
    return response.data;
}

export {searchEvent};