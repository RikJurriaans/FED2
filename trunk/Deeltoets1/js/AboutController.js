var AboutController = function() {
    var self = this;
    var template = 'about';

    var About = {
        title: 'Rik Jurriaans',
        description: 'Mijn naam is Rik Jurriaans en ik haat MVC'
    };

    var view = new View(template, About);

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

