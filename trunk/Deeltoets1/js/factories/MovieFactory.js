function MovieFactory() {
    var Movie = function() {
        return {
            title: 'no title',
            releaseDate: 'no release date',
            cover: 'no_cover.img',
            discription: 'no discription available.'
        }
    };

    return {
        createMovie: function(title, releaseDate, cover, description) {
            // Create a new movie object.
            var movie = new Movie();

            // Set the params.
            movie.title = title;
            movie.releaseDate = releaseDate;
            movie.cover = cover;
            movie.description = description;

            return movie;
        }
    }
}();
