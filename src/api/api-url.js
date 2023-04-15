const API_URL = (async () => {
    const data = await fetch('/conf.json').then(async (response) => {
        const responseJson = await response.json().then((json) => {
            return json.api_url
        })
        return responseJson;
    });
    return data;
})();

export default API_URL;