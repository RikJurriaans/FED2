(function(domElement) {
    var aboutController = new AboutController(),
        moviesController = new MoviesController();

    var Router = {
        registerRoutes: function() {
            routie('about', function() {
                // dit kan wel abstracter.
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
}('content'));
