springAngularStarter.config(function ($routeProvider) {
    return $routeProvider
        .otherwise({
            controller: 'PetsController',
            templateUrl: 'src/main/templates/pets.ngt'
        });
});