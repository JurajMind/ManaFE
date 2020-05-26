manaFbLogin = function () {
    FB.login(function (response) {
        if (response.authResponse) {
            console.log(response);
            console.log(response.authResponse.accessToken);
            callback(response.authResponse.accessToken);

        } else {
            console.log('User cancelled login or did not fully authorize.');
        }
    });
}

callback;
