(function Router(route) {
    // var ROUTES_FILE = 'routes.json';

    // if (typeof routesUrl !== 'undefined') {
    //     ROUTES_FILE = routesUrl;
    // }

    // loadRoutes(ROUTES_FILE);

    // function loadRoutes() {
    // }

    var ROUTES = {
        home : {
            route: 'home',
            action: function() {
                console.log('hallo');
            }
        }, 
        aap : {
            route: 'aap',
            action: function() {
                alert('aap');
            }
        }
    };


    var path = parse(window.location.pathname);

    function parse(path) {
        var p = _.without(path.split('/'), '');
        return p;
    }

    if (path === [] || typeof route === 'undefined') {
        routeTo('home');
    } else if (typeof route !== 'undefined') {
        routeTo(route);
    }

    function routeTo(route) {
        ROUTES[route].action();
    }

    return this;
}());
