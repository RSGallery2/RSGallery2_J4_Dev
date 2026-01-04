describe('RSG2 visit all backend views', () => {

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

        cy.visit('/administrator/index.php?option=com_rsgallery2');
    })

    it('Enter all Views (1: main) ', function () {

        cy.get('#j-main-container a[href="/cypress_5x/administrator/index.php?option=com_rsgallery2&view=galleries"] div.quickicon-icon').click();
        cy.get('#toolbar-cancel button.button-cancel').click();
        cy.get('#j-main-container a[href="/cypress_5x/administrator/index.php?option=com_rsgallery2&view=upload"] div.quickicon-icon').click();
        cy.get('#menu-249 a[href="index.php?option=com_rsgallery2"] span.sidebar-item-title').click();
        cy.get('#j-main-container a[href="/cypress_5x/administrator/index.php?option=com_rsgallery2&view=images"] div.quickicon-icon').click();
        cy.get('#toolbar-cancel button.button-cancel').click();
        cy.get('#j-main-container div.fa-cogs').click();
        cy.get('#toolbar-cancel button.button-cancel').click();

    });

    it('At least one gallery exists', function () {
        cy.visit('/administrator/index.php?option=com_rsgallery2&view=galleries')

        cy.get('#galleryList tr.row0 td:nth-child(1)').should('exist');

        cy.get('#galleryList span.icon-publish').should('have.class', 'icon-publish');

    });

    it('No images ', function () {
        cy.visit('/administrator/index.php?option=com_rsgallery2&view=images')

        cy.get('#adminForm div.alert').should('have.text',
            '\n                                Info\n                                Empty list. No image has been found (uploaded ?)                            ');
        cy.get('[name="list[limit]"]').should('have.id', 'list_limit');

    });

});

//
// it('No images ', function () {
//     cy.visit('/administrator/index.php?option=com_rsgallery2&view=images')
//
//     cy.get('[name="username"]').click();
//     cy.get('[name="username"]').type('cypress_test');
//     cy.get('[name="passwd"]').type('cypresscypress');
//     cy.get('#btn-login-submit').click();
//     cy.get('[name="username"]').click();
//     cy.get('[name="username"]').type('cypress_test');
//     cy.get('[name="passwd"]').click();
//     cy.get('[name="passwd"]').type('rsgallery2rsgallery2');
//     cy.get('#btn-login-submit').click();
//     cy.get('#adminForm div.alert').should('have.text',
//         '\n                                Info\n                                Empty list. No image has been found (uploaded ?)                            ');
//     cy.get('[name="list[limit]"]').should('have.id', 'list_limit');
//
// });
//

