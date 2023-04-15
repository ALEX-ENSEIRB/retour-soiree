class User {

    static isConnected = () => {
        const connected = localStorage.getItem('connected');
        if (connected === 'true') {
            return true;
        } else {
            return false;
        }
    }

    static disconect = () => {
        localStorage.removeItem('connected');
        localStorage.removeItem('user');
        return false;
    }
}

export default User