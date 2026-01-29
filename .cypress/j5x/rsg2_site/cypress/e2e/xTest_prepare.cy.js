
let galleryName = "cy test";
let imageName = "test_coffee.jpg";

beforeEach(() => {
	cy.viewport(1200, 1100);

// 	cy.visit('/');

// 	//--- select upload view ----------------------------------

// 	cy.visit('/j3x-root-galleries');
});

it('Enter all Views (at once) ', function () {

	cy.visit('/');

	cy.get('h1').should('exist');
	cy.get('h1').contains(' Home ').should('exist');
	
	cy.get('.alert-heading').should('not.exist');

	cy.log('HOME found');

});
