describe('Delete gallery love locks', () => {

    beforeEach(() => {

        cy.viewport(1000, 1100);

        //--- login ----------------------------------

        cy.visit('/');
        cy.get('[name="username"]').click();
        cy.get('[name="username"]').type(Cypress.env("login_name"));
        cy.get('[name="password"]').click();
        cy.get('[name="password"]').type(Cypress.env("login_pass"));
        cy.get('[name="Submit"]').click();

        // cy.get('[name="Submit"]').click();
        cy.get('#btn-login-submit').click();

        //--- visit gallery list ----------------------------------

        cy.visit('/administrator/index.php?option=com_rsgallery2&view=galleries');
        cy.get('h1').contains(' Manage galleries');
        cy.get('h1 > span.icon-images'); // Manage galleries

        cy.get('.alert-heading').should('not.exist');

        //--- select show all ----------------------------------

        cy.get('select#list_limit').should('exist');
        cy.get('select#list_limit').trigger('click');
        cy.get('select#list_limit').select('All');
        cy.get('select#list_limit').trigger('click');

        // gallery should exist
        cy.get('a').contains('rsg love locks').should('exist');

    })

    it('delete gallery', () => {

        //--- delete gallery ----------------------------------

        // go parent up to tr (row) , then siblings find child with class '.icon-edit'
        cy.get('a').contains('cy love locks')
            .parent().parent()
            .find('.icon-trash')
            .click();

        //--- check messages gallery is created ----------------------------------

        cy.log('--- check messages gallery is deleted');
        // success message ... from code  (actually second one)
        //cy.get('.alert-message').eq(1).should('have.text', 'Item successfully saved.');
        //cy.get('.alert-message').contains('Item successfully saved.');
        cy.get('.alert-message').eq(1).should('have.text', 'Item deleted.');

        //--- select show all ----------------------------------

        cy.get('select#list_limit').should('exist');
        cy.get('select#list_limit').trigger('click');
        cy.get('select#list_limit').select('All');
        cy.get('select#list_limit').trigger('click');

        //--- check gallery is deleted ----------------------------------

        cy.log('--- check gallery is deleted');
        cy.get('a').contains('rsg love locks').should('not.exist');

    })

})
