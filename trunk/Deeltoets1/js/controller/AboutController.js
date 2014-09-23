var AboutController = function() {
    // super class.
    var _super = new Controller('about', new JsonModel('data/about.json'));

    // all public variables go here.
    var publics = {
    
    
    };

    // for inheritance.
    publics = _.extend(_super, publics);

    return publics;
};
