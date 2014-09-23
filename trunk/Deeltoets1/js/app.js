(function() {
    var aboutController = new AboutController(),
        moviesController = new MoviesController();

    console.log(aboutController);

    var Router = {
        registerRoutes: function() {
            routie('about', function() {
                aboutController.view.show();
                moviesController.view.hide();
            });
            routie('movies', function() {
                aboutController.view.hide();
                moviesController.view.show();
            });
        }
    };

    Router.registerRoutes();
}());
