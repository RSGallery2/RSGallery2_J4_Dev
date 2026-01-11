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

    it('Enter all Views (at once) ', function () {

        cy.get('#j-main-container a[href="/cypress_5x/administrator/index.php?option=com_rsgallery2&view=galleries"] div.quickicon-icon').click();
        cy.get('#toolbar-cancel button.button-cancel').click();
        cy.get('#j-main-container a[href="/cypress_5x/administrator/index.php?option=com_rsgallery2&view=upload"] div.quickicon-icon').click();
        cy.get('#toolbar-cancel button.button-cancel').click();
        cy.get('#j-main-container a[href="/cypress_5x/administrator/index.php?option=com_rsgallery2&view=images"] div.quickicon-icon').click();
        cy.get('#toolbar-cancel button.button-cancel').click();
        cy.get('#j-main-container a[href="/cypress_5x/administrator/index.php?option=com_rsgallery2&view=maintenance"] div.quickicon-icon').click();
        cy.get('#toolbar-cancel button.button-cancel').click();

    });

    it('1: tests on control panel ) ', function () {

        cy.visit('/administrator/index.php?option=com_rsgallery2');

    });

    it('2: tests on galleries ) ', function () {

        cy.get('#j-main-container a[href="/cypress_5x/administrator/index.php?option=com_rsgallery2&view=galleries"] div.quickicon-icon').click();

    });

    it('3: tests on upload ) ', function () {

        cy.get('#j-main-container a[href="/cypress_5x/administrator/index.php?option=com_rsgallery2&view=upload"] div.quickicon-icon').click();

    });

    it('4: tests on images ) ', function () {

        cy.get('#j-main-container a[href="/cypress_5x/administrator/index.php?option=com_rsgallery2&view=images"] div.quickicon-icon').click();

    });

    it('5: tests on maintenance ) ', function () {

        cy.get('#j-main-container a[href="/cypress_5x/administrator/index.php?option=com_rsgallery2&view=maintenance"] div.quickicon-icon').click();

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

