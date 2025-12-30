describe('RSG2 control panel', () => {

    beforeEach(() => {

        cy.viewport(1000, 1100);

        //--- login ----------------------------------

        cy.visit('/administrator/index.php');

        cy.get('[name="username"]').click();
        cy.get('[name="username"]').type(Cypress.env("login_name"));
        cy.get('[name="passwd"]').click();
        cy.get('[name="passwd"]').type(Cypress.env("login_pass"));

        // cy.get('[name="Submit"]').click();
        cy.get('#btn-login-submit').click();
    })

    // // needs admin rights
    // it('finds the content "Configuration"', () => {
    //
    //     cy.visit('/administrator/index.php?option=com_config&view=component&component=com_rsgallery2');
    //     cy.get('h1').contains('RSGallery2 Options');
    //
    // })

    it('finds the content "Manage Galleries"', () => {

        cy.visit('/administrator/index.php?option=com_rsgallery2&view=galleries');
        cy.get('h1').contains(' Manage galleries');
        cy.get('h1 > span.icon-images'); // Manage galleries
    })

    it('finds the content "Upload"', () => {

        cy.visit('/administrator/index.php?option=com_rsgallery2&view=upload');
        cy.get('h1').contains(' Do upload');
        cy.get('h1 > span.icon-upload'); // Do Upload
    })

    it('finds the content "Manage Images"', () => {

        cy.visit('/administrator/index.php?option=com_rsgallery2&view=images');
        cy.get('h1').contains(' Manage images');
        cy.get('h1 > span.icon-image'); // Manage galleries

    })

    it('finds the content "Maintenance"', () => {

        cy.visit('/administrator/index.php?option=com_rsgallery2&view=maintenance');
        cy.get('h1').contains(' Maintenance');
        cy.get('h1 > span.icon-cogs'); // Maintenance

    })

})
