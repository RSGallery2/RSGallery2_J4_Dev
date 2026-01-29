
let galleryName = "cy love locks";
let imageName = "2015-10-11_00001.jpg";

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
	cy.get('#dragarea-content')
		.selectFile(
			[
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00001.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00002.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00003.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00004.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00005.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00006.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00007.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00008.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00009.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00010.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00011.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00012.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00013.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00014.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00015.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00016.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00017.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00018.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00019.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00020.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00021.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00022.jpg',
				'd:/FithBilderRsgallery/Lovelocks.small/2015-10-11_00023.jpg',			]
			, {action: 'drag-drop'});

	//--- check result ----------------------------------

	cy.get('#uploadProgressArea span.label-success').should('have.text', 'finished OK');
	cy.get('#imagesAreaList div.imgContainer').should('be.visible');

	cy.get('div.thumb_caption').should('exist');
	// cy.get('div.thumb_caption > small.thumb_name ').should('exist');
//	cy.get('div.thumb_caption > small.thumb_name ').contains(imageName);

	cy.log('!!! upload success !!!');
});
