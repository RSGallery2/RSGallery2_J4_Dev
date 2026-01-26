
let galleryName = "cy test";

let imageName = "test_coffee.jpg";

beforeEach(() => {

	cy.viewport(1200, 1100);

	//--- login ----------------------------------

	cy.visit('/administrator/index.php');

	cy.get('[name="username"]').click();
	cy.get('[name="username"]').type(Cypress.env("login_name"));
	cy.get('[name="passwd"]').click();
	cy.get('[name="passwd"]').type(Cypress.env("login_pass"));

	// cy.get('[name="Submit"]').click();
	cy.get('#btn-login-submit').click();

	//--- visit gallery list ----------------------------------

//	cy.visit('/administrator/index.php?option=com_rsgallery2&view=galleries');
	cy.visit('/administrator/index.php?option=com_rsgallery2&view=galleries');
	cy.get('h1').contains(' Manage galleries');
	cy.get('h1 > span.icon-images'); // Manage galleries

	cy.get('.alert-heading').should('not.exist');

});

it('01.prepare first ', () => {
	
	cy.get('h1').should('exist');
	cy.get('h1').contains(' Manage galleries').should('exist');
	
	cy.get('.alert-heading').should('not.exist');
	
	cy.log('first ok');
});

it('test 2', function() {
	cy.get('#menu-249 a[href="index.php?option=com_rsgallery2"] span.sidebar-item-title').click();
	cy.get('#j-main-container a[href="/cypress_5x/administrator/index.php?option=com_rsgallery2&view=galleries"] div.quickicon-icon').click();
	cy.get('#galleryList a[href="/cypress_5x/administrator/index.php?option=com_rsgallery2&task=gallery.edit&id=21&extension=com_rsgallery2"]').click();
	cy.get('[name="jform[name]"]').click();
	cy.get('[name="jform[name]"]').type('cy love locks edit');
	cy.get('#toolbar-save button.button-save').click();
	cy.get('#galleryList a[href="/cypress_5x/administrator/index.php?option=com_rsgallery2&task=gallery.edit&id=21&extension=com_rsgallery2"]').click();
	cy.get('[name="jform[name]"]').click();
	cy.get('[name="jform[name]"]').clear();
	cy.get('[name="jform[name]"]').type('cy love locks');
	cy.get('#toolbar-save button.button-save').click();
});
