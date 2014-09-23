var Controller = function(template, model) {
    var data = model.getData();
    var view = new View(template, data);

    return {
        view: view,
        model: model
    };
};

