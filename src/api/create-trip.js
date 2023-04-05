import axios from 'axios';

const API_URL = await fetch('/conf.json').then(async (response) => {
    const responseJson = await response.json().then((json) => {
        return json.api_url
    })
    return responseJson;
});

const createTrip = async (trip) => {
    const data = await axios.post(API_URL + "create_trip.php", trip).then((response) => {
        console.log(response.data);
        return response.data;
    })
    return data;
}

export default createTrip;