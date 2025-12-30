describe('RSG2 **undo** prepare remove of RSG data tables', () => {

    beforeEach(() => {

        cy.viewport(1000, 1100);

        //--- login ----------------------------------

        cy.visit('/administrator/index.php');

        cy.get('[name="username"]').click();
        cy.get('[name="username"]').type(Cypress.env("login_name"));
        cy.get('[name="passwd"]').click();
        cy.get('[name="passwd"]').type(Cypress.env("login_pass"));

        // cy.get('[name="Submit"]').click(); // frontend
        cy.get('#btn-login-submit').click(); // backend
    })

    // Maintenance exists, button exists
    it('finds the content "Maintenance"', () => {
        cy.log ('--- Maintenance tests ---');

        cy.visit('/administrator/index.php?option=com_rsgallery2&view=maintenance');
        cy.get('h1').contains(' Maintenance');
        cy.log ('--- Maintenance exists ---');

        cy.get('.maint-title').contains('Undo prepare remove of RSG2');
        cy.log ('--- Button "Undo prepare ... " exists ---');

        cy.log ('--- Click on "Undo prepare remove of RSG2" ---');
        cy.get('.maint-title').contains('Undo prepare remove of RSG2').click();

        cy.log ('--- test result ---');
        cy.get('.alert-heading').should('exist');
        // cy.get('.alert-message').should('have.text', 'Successful prevented drop of tables on uninstall');
        cy.get('.alert-message').contains('Successful prevented drop of tables on uninstall');

    })

})
