describe('Edit gallery love locks', () => {

    let galleryName = "cy love locks";
    // let galleryName = "cypress gallery temp";
    let galleryEditName = "cypress gallery edited";

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

        //--- check gallery exists in list ----------------------------------

        cy.visit('/administrator/index.php?option=com_rsgallery2&view=galleries');
        cy.get('h1').contains(' Manage galleries');
        cy.get('h1 > span.icon-images'); // Manage galleries

        cy.get('.alert-heading').should('not.exist');

        //--- select show all ----------------------------------

        cy.get('select#list_limit').select('All');

        //--- gallery should exist ----------------------------------

        // gallery should exist
        cy.get('a').contains(galleryName).should('exist');

    })

    it('change gallery name and back', () => {

        //======================================================================
        //--- edit gallery ----------------------------------
        //======================================================================

        cy.get('a').contains(galleryName).should('exist');
        cy.get('a').contains(galleryName).click();
        cy.wait(50);

        //--- check gallery edit form ----------------------------------

        cy.log('--- gallery edit');
        cy.get('h1').contains('Edit gallery');

        // test if matching
        cy.get('[name="jform[name]"]').should('have.value', galleryName);

        //--- change title and alias ----------------------------------

        cy.log('--- Change name and alias');
        cy.get('[name="jform[name]"]').clear().type(galleryEditName);
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
        cy.get('a').contains(galleryEditName).should('exist');

        //======================================================================
        //--- rewrite name to original -------------------------------------------------
        //======================================================================

        cy.get('a').contains(galleryEditName).should('exist');
        cy.get('a').contains(galleryEditName).click();
        cy.wait(50);

        //--- check gallery edit form ----------------------------------

        cy.log('--- gallery edit');
        // cy.get('h1').contains(' Edit gallery');

        // test if matching
        cy.get('[name="jform[name]"]').should('have.value', galleryEditName);

        //--- change title and alias ----------------------------------

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

        //--- finish with check ----------------------------------------------------------

        // gallery name is also link
        // attention: there may be more than one
        cy.get('a').contains(galleryName);

    })

    it('change gallery name and back and check alias', () => {

        //--- edit gallery ----------------------------------

        cy.get('a').contains(galleryName).should('exist');
        cy.get('a').contains(galleryName).click();
        cy.wait(50);

        //--- check gallery edit form ----------------------------------

        cy.log('--- gallery edit');
        cy.get('h1').contains('Edit gallery');

        // test if matching
        cy.get('[name="jform[name]"]').should('have.value', galleryName);

        //--- change title and alias ----------------------------------

        cy.log('--- Change name and alias');
        cy.get('[name="jform[name]"]').clear().type(galleryEditName);
        // cy.get('[name="jform[alias]"]').type(""); // prevent double alias
        cy.get('[name="jform[alias]"]').clear(); // prevent double alias

        //======================================================================
        //--- save and check alias ----------------------------------
        //======================================================================

        // back to list view
        cy.log('--- Save');
        cy.get('button').contains('Save').first().click();
        cy.wait(50);

        //--- check messages gallery is created ----------------------------------

        cy.log('--- check messages gallery is created');
        cy.get('.alert-message').should('have.text', 'Item saved.');

        cy.get('[name="jform[alias]"]')
            .should('have.value', 'cypress-gallery-edited');

        //--- close, goto to list ----------------------------------

        // back to list view
        cy.log('--- Cancel');
        cy.get('button').contains('Close').click();

        //--- select show all ----------------------------------

        cy.get('select#list_limit').select('All');

        //--- check gallery is created ----------------------------------

        cy.log('--- check gallery is created');
        cy.get('a').contains(galleryEditName).should('exist');

        //======================================================================
        //--- rewrite name to original -------------------------------------------------
        //======================================================================

        cy.get('a').contains(galleryEditName).should('exist');
        cy.get('a').contains(galleryEditName).click();
        cy.wait(50);

        //--- check gallery edit form ----------------------------------

        cy.log('--- gallery edit');
        // cy.get('h1').contains(' Edit gallery');

        // test if matching
        cy.get('[name="jform[name]"]').should('have.value', galleryEditName);

        //--- change title and alias ----------------------------------

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

        //--- finish with check ----------------------------------------------------------

        // gallery name is also link
        // attention: there may be more than one
        cy.get('a').contains(galleryName);

    })

})
