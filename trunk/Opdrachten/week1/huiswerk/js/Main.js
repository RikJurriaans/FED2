(function () {
    function Person(name) {
        if (typeof name != 'string')
            console.error('Dude... name is a string');

        // tis niet handig als je iemands naam van buiten af kunt veranderen.
        var name = name;

        this.speak = function() {
            console.log('Hallo mijn naam is', name);
        };
    }

    var rik = new Person('Rik');

    Person.prototype.walk = function() {
        console.log('Loop loop loop');
    };
    Person.prototype.eat = function(food) {
        console.log('Ik vind dat niet lekker...');
    };

    rik.speak();
    rik.walk();
    rik.eat('pannekoeken');


    var Person = {
        speak: function() {
            console.log('Breath breath in the air');
        }, 
        name: 'Rik',
        walk: function() {
            console.log('Walk n talk');
        },
        eat: function() {
            console.log('mmmmmmm');
        }
    }

}());
