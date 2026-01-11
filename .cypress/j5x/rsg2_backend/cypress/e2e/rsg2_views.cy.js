describe('RSG2 visit all backend views', () => {

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

        cy.visit('/administrator/index.php?option=com_rsgallery2');
    })

    it.skip('Enter all Views (at once) ', function () {

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
        
        cy.get('#j-main-container a[href="/cypress_5x/administrator/index.php?option=com_rsgallery2&view=galleries"] span.j-links-link').should('have.text', 'Manage Galleries');
        cy.get('#galleriesTable caption').should('have.text', 'Most recently added galleries');
        cy.get('#imagesTable caption').should('have.text', 'Most recently added images');

    });

    it('2: tests on galleries ) ', function () {
        
        cy.get('#j-main-container a[href="/cypress_5x/administrator/index.php?option=com_rsgallery2&view=galleries"] div.quickicon-icon').click();
        cy.get('#header h1.page-title').should('have.text', '\n        Manage galleries');

        cy.get('#galleryList a[data-order="a.name"] span:nth-child(1)').should('have.text', 'Name');
        cy.get('#galleryList a[data-order="image_count"] span:nth-child(1)').should('have.text', 'Images');
        cy.get('#galleryList a[data-order="a.created_by"] span:nth-child(1)').should('have.text', 'Author');
        cy.get('#galleryList a[data-order="a.created"] span:nth-child(1)').should('have.text', 'Date Created');

    });

    it('3: tests on upload ) ', function () {
        
        cy.get('#j-main-container a[href="/cypress_5x/administrator/index.php?option=com_rsgallery2&view=upload"] div.quickicon-icon').click();
        cy.get('#header h1.page-title').should('have.text', '\n        Do upload');
        
        cy.get('#select-file-button-drop').should('have.text', '\n                                                    \n                                                    Upload selected files                                                ');
        cy.get('#select-file-button-drop').should('have.text', '\n                                                    \n                                                    Upload selected files                                                ');
        cy.get('#uploader-wrapper').click();
        cy.get('#j-main-container span.mb-2').should('have.text', '\n                            Upload files by using drag and drop or select multiple files                        ');

    });

    it('4: tests on images ) ', function () {

        cy.get('#j-main-container a[href="/cypress_5x/administrator/index.php?option=com_rsgallery2&view=images"] div.quickicon-icon').click();
        cy.get('#header h1.page-title').should('have.text', '\n        Manage images');

    });

    it('5: tests on maintenance ) ', function () {

        cy.get('#j-main-container a[href="/cypress_5x/administrator/index.php?option=com_rsgallery2&view=maintenance"] div.quickicon-icon').click();
        cy.get('#header h1.page-title').should('have.text', '\n        Maintenance: Look after RSGallery2');

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

