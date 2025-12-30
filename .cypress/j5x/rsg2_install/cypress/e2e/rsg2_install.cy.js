describe('RSG2 install from ', () => {

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

    it('upload RSG2 zip file into "Extensions: Install"', () => {
        cy.log ('-----------------------------------------');
        cy.log ('Install RSG2');
        cy.log ('-----------------------------------------');

        cy.visit('/administrator/index.php?option=com_installer&view=install');
        cy.get('h1').contains(' Extensions: Install');

        cy.log ('--- drag zip ---');

        cy.get('#dragarea')
            .selectFile('cypress/fixtures/rsgallery2.zip', {action: 'drag-drop'});

        cy.log ('--- Wait for installing ---');
        cy.wait(5000);

        cy.log ('--- Answer exists ---');
        cy.get('#system-message-container').should('exist');
        cy.get('.alert-heading').should('exist');

        cy.log ('--- Answer negatve ---');
        cy.get('div.uppy-StatusBar is-error').should('not.exist');

        cy.log ('--- Answer positive ---');
        cy.get('.alert-message').contains('Installation of the component was successful.');

    })

})
