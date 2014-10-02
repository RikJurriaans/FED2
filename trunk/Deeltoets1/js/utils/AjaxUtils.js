var AjaxUtils = function() {
    function error(message) {
        console.error(message);
    }
    function complete(message) {
        console.log(message);
    }

    return {
        // returns function.
        load: function(url) {
            var l = qwest.get(url);
            // returns an qwest success function.
            return l.success;
        }
    };
}();
