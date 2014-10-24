springAngularStarter.service('PetRepository', function() {
    return {
        getAll: function() {
            return [
                { name: "Mr. Bun Bun", age: 5 },
                { name: "Hobbes", age: 2 }
            ];
        }
    };
});