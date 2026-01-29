
let galleryName = "cy test";

let imageName = "test_coffee.jpg";

beforeEach(() => {
	cy.viewport(1200, 1100);

// 	cy.visit('/');

// 	//--- select upload view ----------------------------------

// 	cy.visit('/j3x-root-galleries');
});

it('Enter all views (at once) ', function () {

	cy.visit('/');

	cy.get('h1').should('exist');
	cy.get('h1').contains(' Home ').should('exist');
	
	cy.get('.alert-heading').should('not.exist');

	cy.log('HOME found');

	// Wait for visual check
    cy.wait(2000);
	cy.get('a[href="/cypress_5x/j3x-root-galleries"]').should('have.text', '[J3x] Root galleries ');
	cy.get('a[href="/cypress_5x/j3x-root-galleries"]').click();
	// Wait for visual check
	cy.wait(2000);

	cy.get('a[href="/cypress_5x/j3x-single-gallery"]').should('have.text', '[J3x] Single gallery ');
	cy.get('a[href="/cypress_5x/j3x-single-gallery"]').click();
	// Wait for visual check
	cy.wait(2000);

	cy.get('a[href="/cypress_5x/j3x-slideshow"]').should('have.text', '[J3x] Slideshow');
	cy.get('a[href="/cypress_5x/j3x-slideshow"]').click();
	// Wait for visual check
	cy.wait(3000);

	cy.get('a[href="/cypress_5x/j3x-slide-page"]').should('have.text', '[J3x] Slide page');
	cy.get('a[href="/cypress_5x/j3x-slide-page"]').click();
	// Wait for visual check
	cy.wait(2000);

	cy.get('a[href="/cypress_5x/rsg2-single-gallery?id=23"]').should('have.text', 'RSG2 Single Gallery');
	cy.get('a[href="/cypress_5x/rsg2-single-gallery?id=23"]').click();
	// Wait for visual check
	cy.wait(2000);

	cy.get('a[href="/cypress_5x/rsg2-slideshow?id=23"]').should('have.text', 'RSG2 Slideshow');
	cy.get('a[href="/cypress_5x/rsg2-slideshow?id=23"]').click();

});

