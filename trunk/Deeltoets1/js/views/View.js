var View = function(templateId, data) {
    // Load view.
    var elem = document.getElementById(templateId);
    console.log(elem);
    Transparency.render(elem, data);

    return {
        hide: function() {
            elem.className = 'noshow';
        },
        show: function() {
            elem.className = 'show';
        }
    }
};
