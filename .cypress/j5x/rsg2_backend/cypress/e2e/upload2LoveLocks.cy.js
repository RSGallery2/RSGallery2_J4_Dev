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

it('upload file into gallery love locks', () => {

	cy.get('h1').should('exist');
	cy.get('h1').contains(' Do upload').should('exist');

	cy.get('.alert-heading').should('not.exist');

	//--- select category cy love locks ----------------------------------

	cy.log('selection click ');
	cy.get('[name="SelectGallery"]').contains('cy love locks').should('exist');
	cy.get('[name="SelectGallery"]').select('cy love locks');

	//--- upload file (name) ----------------------------------
		
	cy.get('#dragarea-content')
		.selectFile('cypress/fixtures/images/2015-10-11_00001.jpg', {action: 'drag-drop'});

	//--- check result ----------------------------------

	cy.get('#uploadProgressArea span.label-success').should('have.text', 'finished OK');
	cy.get('#imagesAreaList div.imgContainer').should('be.visible');

	cy.get('div.thumb_caption').should('exist');
	// cy.get('div.thumb_caption > small.thumb_name ').should('exist');
	cy.get('div.thumb_caption > small.thumb_name ').contains('2015-10-11_00001');

	cy.log('!!! upload success !!!');
});
