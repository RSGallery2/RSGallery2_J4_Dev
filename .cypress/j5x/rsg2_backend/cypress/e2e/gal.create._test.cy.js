describe('Create gallery test', () => {

    let galleryName = "cy test";

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

        cy.visit('/administrator/index.php?option=com_rsgallery2&view=galleries');
        cy.get('h1').contains(' Manage galleries');
        cy.get('h1 > span.icon-images'); // Manage galleries

        cy.get('.alert-heading').should('not.exist');

        //--- select show all ----------------------------------

        cy.get('select#list_limit').select('All');

        // gallery does not exist
        cy.get('a').contains(galleryName).should('not.exist');
        

        //--- select new gallery ----------------------------------

        cy.get('button').contains('New').click();
        // cy.get('a:contains("New gallery")');

    })

    it('fill out a new gallery (test)', () => {

        //--- check gallery form ----------------------------------

        cy.log('--- User gallery edit');
        cy.get('h1').contains(' Edit gallery');

        //--- change name and alias ----------------------------------

        cy.log('--- Change name and alias');
        cy.get('[name="jform[name]"]').clear().type(galleryName);
        // cy.get('[name="jform[alias]"]').type(""); // prevent double alias
        cy.get('[name="jform[alias]"]').clear(); // prevent double alias

        //--- save and exit to list ----------------------------------

        // back to list view
        cy.log('--- Save and Close');
        cy.get('button').contains('Save & Close').click();

        //--- check messages gallery is created ----------------------------------

        cy.log('--- check messages gallery is created');
        cy.get('.alert-message').should('have.text', 'Item saved.');

        //--- select show all ----------------------------------

        cy.get('select#list_limit').select('All');

        //--- check gallery is created ----------------------------------

        cy.log('--- check gallery is created');
        cy.get('a').contains(galleryName).should('exist');

    })

})
