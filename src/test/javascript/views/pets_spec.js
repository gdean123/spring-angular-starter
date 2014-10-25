describe("Pets", function () {
    var view;

    beforeEach(inject(function ($scope, renderTemplate, PetRepository) {
        spyOn(PetRepository, 'getAll').and.returnValue([
            { name: "Sox", age: 5 },
            { name: "Jake", age: 2 }
        ]);

        view = renderTemplate('pets', $scope);
    }));

    function petCard(index) {
        return view.find(".pet-card")[index];
    }

    it("shows a card for each pet", function () {
        expect(petCard(0)).toContainText("Sox");
        expect(petCard(0)).toContainText("Age 5");

        expect(petCard(1)).toContainText("Jake");
        expect(petCard(1)).toContainText("Age 2");
    });
});