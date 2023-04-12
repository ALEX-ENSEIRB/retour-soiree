class User {

    static isConnected = () => {
        const connected = localStorage.getItem('connected');
        console.log(connected);
        if (connected === 'true') {
            return true;
        } else {
            return false;
        }
    }

    static disconect = () => {
        localStorage.removeItem('connected');
        return false;
    }
}

export default User