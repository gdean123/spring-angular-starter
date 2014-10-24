springAngularStarter.controller('PetsController', function($scope, PetRepository) {
    $scope.pets = PetRepository.getAll();
});