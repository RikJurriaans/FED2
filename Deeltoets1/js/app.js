(function() {
    var aboutController = new AboutController(),
        moviesController = new MoviesController();

    var Router = {
        registerRoutes: function() {
            routie('about', aboutController.view);
            routie('movies', moviesController.view);
        }
    };

    Router.registerRoutes();

}());
