function MovieFactory() {
    var Movie = function() {
        return {
            title: 'no title',
            releaseDate: 'no release date'
        }
    };

    return {
        createMovie: function(title, releaseDate) {
            // Create a new movie object.
            var movie = new Movie();
            movie.title = title;
            movie.releaseDate = releaseDate;

            return movie;
        }
    }
}();
