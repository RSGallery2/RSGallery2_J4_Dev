
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
	cy.visit('/administrator/index.php?option=com_rsgallery2&view=upload');
});

it('upload file into gallery ', () => {

	cy.get('h1').should('exist');
	cy.get('h1').contains(' Do upload').should('exist');

	cy.get('.alert-heading').should('not.exist');

	//--- select gallery ----------------------------------

	cy.log('select gallery ');

	cy.get('[name="SelectGallery"]').select(galleryName);

	//--- upload file (name) ----------------------------------

	cy.log('upload file ');
	cy.get('#dragarea-content')
		.selectFile('cypress/fixtures/images/' + imageName, {action: 'drag-drop'});

	//--- check result ----------------------------------

	cy.get('#uploadProgressArea span.label-success').should('have.text', 'finished OK');
	cy.get('#imagesAreaList div.imgContainer').should('be.visible');

	cy.get('div.thumb_caption').should('exist');
	// cy.get('div.thumb_caption > small.thumb_name ').should('exist');
	cy.get('div.thumb_caption > small.thumb_name ').contains(imageName);

	cy.log('!!! upload success !!!');
});
