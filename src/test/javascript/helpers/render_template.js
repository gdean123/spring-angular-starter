springAngularStarter.service('renderTemplate', function($templateCache, $compile) {
    return function renderTemplate(template, $scope) {
        var templateHtml = $templateCache.get('templates/' + template);
        var linkedElement = $compile(templateHtml)($scope);
        var renderedElement = $('<div></div>').append(linkedElement);
        $scope.$apply();

        return renderedElement;
    }
});