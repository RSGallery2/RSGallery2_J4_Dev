describe('RSG2 control panel', () => {

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

        cy.visit('/administrator/index.php?option=com_rsgallery2');

    })

    // need admin rights
    // it('finds the content "Configuration"', () => {

    // cy.visit('/administrator/index.php?option=com_rsgallery2');
    // cy.get('.j-links-link').contains('Configuration');

    // })

    it('finds the content "Manage Galleries"', () => {

        cy.visit('/administrator/index.php?option=com_rsgallery2');
        cy.get('.j-links-link').contains('Manage Galleries');

    })

    it('finds the content "Upload"', () => {

        cy.visit('/administrator/index.php?option=com_rsgallery2');
        cy.get('.j-links-link').contains('Upload');

    })

    it('finds the content "Manage Images"', () => {

        cy.visit('/administrator/index.php?option=com_rsgallery2');
        cy.get('.j-links-link').contains('Manage Images');

    })

    it('finds the content "Maintenance"', () => {

        cy.visit('/administrator/index.php?option=com_rsgallery2');
        cy.get('.j-links-link').contains('Maintenance');

    })

})
