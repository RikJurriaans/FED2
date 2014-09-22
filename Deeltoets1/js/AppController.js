function AppController() {
    routie({
        'movies': function() {
            alert('movies');
        },
        'about': function() {
            alert('about');
        }
    });

    return {
    };
}
