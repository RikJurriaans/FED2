var AboutController = function() {
    // super class.
    var data = new AboutModel();
    data.getData();

    var _super = new Controller('about', data);

    // all public variables go here.
    var publics = {
    
    
    };

    // for inheritance.
    publics = _.extend(_super, publics);

    return publics;
};
