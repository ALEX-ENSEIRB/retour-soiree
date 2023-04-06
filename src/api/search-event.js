import axios from 'axios';

const API_URL = await fetch('/conf.json').then(async (response) => {
    const responseJson = await response.json().then((json) => {
        return json.api_url
    })
    return responseJson;
});
console.log(API_URL);
const searchEvent = async (trip) => {
    const response = await axios.get(API_URL + "search_event.php");
    return response.data;
}

export {searchEvent};