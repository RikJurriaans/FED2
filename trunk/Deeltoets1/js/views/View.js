var View = function(templateId, data) {
    var elem = document.getElementById(templateId);
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
