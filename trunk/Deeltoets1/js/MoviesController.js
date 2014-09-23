function MoviesController() {
    var self = this;
    var template = 'movies';

    var view = new View(template, About);

    addMovie = function() {
        MovieFactory.createMovie();
    }

    return {
        view: view,

        setTitle: function(title) {
            About.title = title;
            return self;
        },

        setDescription: function(description) {
            About.description = description;
        }
    };

};
