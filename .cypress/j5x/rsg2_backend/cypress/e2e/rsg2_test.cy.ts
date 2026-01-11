import {loginBackend} from '../support/backend/loginBackend'

beforeEach(() => {

    cy.viewport(1000, 1100);

    //--- login ----------------------------------

//    cy.session('loginTestingUser', () => {
    let login = new loginBackend();
    cy.log(JSON.stringify(loginBackend));
    cy.log(JSON.stringify(login));

    //login.visitAdmin();
    // loginBackend.visitAdmin();
    // loginBackend.loginAdmin();
    // }, {
    //     cacheAcrossSpecs: true
    // })

//    loginBackend.visitRsg2();
    // cy.visit('/administrator/index.php?option=com_rsgallery2');
});

it.only('2: tests on galleries ) ', function () {

    cy.get('#j-main-container a[href="/cypress_5x/administrator/index.php?option=com_rsgallery2&view=galleries"] div.quickicon-icon').click();
    cy.get('#header h1.page-title').should('have.text', '\n        Manage galleries');

});

// cy.get('#galleryList a[data-order="a.name"] span:nth-child(1)').should('have.text', 'Name');
// cy.get('#galleryList a[data-order="image_count"] span:nth-child(1)').should('have.text', 'Images');
// cy.get('#galleryList a[data-order="a.created_by"] span:nth-child(1)').should('have.text', 'Author');
// cy.get('#galleryList a[data-order="a.created"] span:nth-child(1)').should('have.text', 'Date Created');
//

