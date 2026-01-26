describe('Delete image test', () => {

    let imageName = "test_coffee";
    let imageEditName = "cypress image edited";

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

        //--- check image exists in list ----------------------------------

        cy.visit('/administrator/index.php?option=com_rsgallery2&view=images');
        // cy.get('#header h1.page-title')
        //     .should('have.text', '\n        Manage images');
        cy.get('h1').contains(' Manage images');

        cy.get('h1 > span.icon-image'); // Manage galleries

        cy.get('.alert-heading').should('not.exist');

        //--- select show all ----------------------------------

        cy.get('select#list_limit').select('All');

        // image should exist
        cy.get('a').contains(imageName).should('exist');

    })

    it('change image name and back', () => {

        //======================================================================
        //--- edit image ----------------------------------
        //======================================================================

        cy.get('a').contains(imageName).should('exist');
        cy.get('a').contains(imageName).click();
        cy.wait(50);

        //--- check image edit form ----------------------------------

        cy.log('--- image edit');
        cy.get('h1').contains('Edit image');

        // test if matching
        cy.get('[name="jform[title]"]').should('have.value', imageName);

        //--- change title and alias ----------------------------------

        cy.log('--- Change name and alias');
        cy.get('[name="jform[title]"]').clear().type(imageEditName);
        // cy.get('[name="jform[alias]"]').type(""); // prevent double alias
        cy.get('[name="jform[alias]"]').clear(); // prevent double alias

        //--- save and exit to list ----------------------------------

        // back to list view
        cy.log('--- Save and Close');
        cy.get('button').contains('Save & Close').click();

        //--- check messages image is created ----------------------------------

        cy.log('--- check messages image is created');
        cy.get('.alert-message').should('have.text', 'Item saved.');

        //--- select show all ----------------------------------

        cy.get('select#list_limit').select('All');

        //--- check image is created ----------------------------------

        cy.log('--- check image is created');
        cy.get('a').contains(imageEditName).should('exist');

        //======================================================================
        //--- rewrite name to original -------------------------------------------------
        //======================================================================

        cy.get('a').contains(imageEditName).should('exist');
        cy.get('a').contains(imageEditName).click();
        cy.wait(50);

        //--- check image edit form ----------------------------------

        cy.log('--- image edit');
        // cy.get('h1').contains(' Edit image');

        // test if matching
        cy.get('[name="jform[title]"]').should('have.value', imageEditName);

        //--- change title and alias ----------------------------------

        cy.log('--- Change name and alias');
        cy.get('[name="jform[title]"]').clear().type(imageName);
        // cy.get('[name="jform[alias]"]').type(""); // prevent double alias
        cy.get('[name="jform[alias]"]').clear(); // prevent double alias

        //--- save and exit to list ----------------------------------

        // back to list view
        cy.log('--- Save and Close');
        cy.get('button').contains('Save & Close').click();

        //--- check messages image is created ----------------------------------

        cy.log('--- check messages image is created');
        cy.get('.alert-message').should('have.text', 'Item saved.');

        //--- select show all ----------------------------------

        cy.get('select#list_limit').select('All');

        //--- check image is created ----------------------------------

        cy.log('--- check image is created');
        cy.get('a').contains(imageName).should('exist');

        //--- finish with check ----------------------------------------------------------

        // image name is also link
        // attention: there may be more than one
        cy.get('a').contains(imageName);

    })

})
