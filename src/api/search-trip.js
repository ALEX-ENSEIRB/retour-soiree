import axios from 'axios';

const API_URL = await fetch('/conf.json').then(async (response) => {
    const responseJson = await response.json().then((json) => {
        return json.api_url
    })
    return responseJson;
});
console.log(API_URL);
const searchTrip = async (trip) => {
    const response = await axios.get(API_URL + "search_trip.php");
    return response.data;
}

export default searchTrip;