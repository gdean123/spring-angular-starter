(function(module) {
try {
  module = angular.module('templates');
} catch (e) {
  module = angular.module('templates', []);
}
module.run(["$templateCache", function($templateCache) {
  $templateCache.put('src/main/templates/pets.ngt',
    '<div ng-controller="PetsController">\n' +
    '    <div class="pet-card" ng-repeat="pet in pets">\n' +
    '        {{pet.name}}\n' +
    '        Age {{pet.age}}\n' +
    '    </div>\n' +
    '</div>');
}]);
})(springAngularStarter);
