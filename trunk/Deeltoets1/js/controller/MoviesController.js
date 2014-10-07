var MoviesController = function() {
    var _super = new Controller('movies', new MoviesModel());

    var publics = {


    };

    publics = _.extend(_super, publics);

    return publics;
};
