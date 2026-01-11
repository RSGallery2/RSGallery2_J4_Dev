
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

	//--- select upload view ----------------------------------

	// cy.visit('/administrator/index.php?option=com_rsgallery2');
	cy.visit('/administrator/index.php?option=com_rsgallery2&view=images');
});

it('prepare first ', () => {
	
	cy.get('.alert-heading').should('not.exist');
	
	cy.log('first ok');
	cy.get('#menu-249 a[href="index.php?option=com_rsgallery2&view=images"] span.sidebar-item-title').click();
	cy.get('#cb0').check();
	cy.get('#toolbar-status-group button.dropdown-toggle').click();
	cy.get('#status-group-children-trash button.button-trash').click();
	cy.get('#adminForm button.js-stools-btn-filter').click();
	cy.get('[name="filter[published]"]').select('-2');
	cy.get('#galleryList tr[data-item-id="20"] td:nth-child(3)').click();
	cy.get('#toolbar-delete button.button-delete').click();
	cy.get('button.button-primary').click();
});
