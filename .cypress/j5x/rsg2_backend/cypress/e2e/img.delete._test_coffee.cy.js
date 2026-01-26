describe('Delete image test', () => {

    // let imageTitle = "test_coffee.jpg";
    let imageTitle = "test_coffee";

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

        //--- visit image list ----------------------------------

        cy.visit('/administrator/index.php?option=com_rsgallery2&view=images');
        cy.get('#header h1.page-title').should('have.text', '\n        Manage images');
        cy.get('h1 > span.icon-image'); // Manage galleries

        cy.get('.alert-heading').should('not.exist');

        //--- select show all ----------------------------------

        cy.get('select#list_limit').select('All');

        // image should exist
        cy.get('a').contains(imageTitle).first().should('exist');

    })

    it('delete image', () => {

        //-----------------------------------------------------
        //--- thrash image ----------------------------------
        //-----------------------------------------------------

        cy.log('--- Thrash image ---------------------------------- ');

        //--- select image ----------------------------------
        cy.log('--- Select image ');

        // go parent up to tr (row) , then siblings find child with class '.icon-edit'
        cy.get('a').contains(imageTitle).first()
            .parent().parent()
            .find('[name="cid[]"]')
            .click();

        //--- Actions trash ----------------------------------

        cy.log('--- Actions trash ');

        // cy.get('button.dropdown-toggle:visible').contains(" Actions").should('exist');
        // cy.get('button.dropdown-toggle:visible').contains(" Actions").click();
        //
        // cy.get('#status-group-children-trash').should('exist');
        // cy.get('#status-group-children-trash').click();

        cy.get('#toolbar-status-group button.dropdown-toggle').click();
        cy.get('#status-group-children-trash button.button-trash').click();

        //--- check image is thrashed ----------------------------------

        cy.log('--- check message image is thrashed');
        cy.get('.alert-message').should('have.text', '1 items successfully trashed');

        //--- select show all ----------------------------------

        cy.get('select#list_limit').select('All');

        //--- check if image is trashed ----------------------------------

        cy.log('--- check image is thrashed and can not be seen');
        cy.get('a').contains(imageTitle).should('not.exist');

        //-----------------------------------------------------
        //--- delete image ----------------------------------
        //-----------------------------------------------------

        cy.log('--- Delete image ---------------------------------- ');

        //--- Select trash view ----------------------------------

        cy.log('--- Select trash view ');
        cy.get('button.filter-search-actions__button').contains("Filter Options").should('exist');
        // cy.get('button.filter-search-actions__button').trigger('click');
// actually not needed why ? expected to be needed:       cy.get('button.filter-search-actions__button').contains("Filter Options").click();

        cy.get('select#filter_published').should('exist');
        cy.get('select#filter_published').trigger('click');
        cy.get('select#filter_published').select('Trashed');
        cy.get('select#filter_published').trigger('Trashed');

        // image should exist
        cy.get('a').contains(imageTitle).first().should('exist');

        //--- select image ----------------------------------

        cy.log('--- Select image (trashed) ');

        // go parent up to tr (row) , then siblings find child with class '.icon-edit'
        cy.get('a').contains(imageTitle).first()
            .parent().parent()
            .find('[name="cid[]"]')
            .click();

        //--- Delete trashed image ----------------------------------

        cy.log('--- Delete image (trashed) ');
        cy.get('#toolbar-delete').should('exist');
        cy.get('#toolbar-delete').click();

        cy.log('--- Confirm Delete image ');

        cy.wait(50).debug();
        cy.get('button').contains("Yes").should('exist');
        cy.get('button').contains("Yes").click();
        cy.on('window:confirm', () => true);

        cy.log('--- check message image is deleted');
        cy.get('.alert-message').should('have.text', '1 items successfully deleted');

        //--- Select all visible ----------------------------------

        cy.log('--- Select all visible ');
        // cy.get('button.filter-search-actions__button').should('exist');
        // cy.get('button.filter-search-actions__button').click();

        cy.get('select#filter_published').should('exist');
        cy.get('select#filter_published').trigger('click');
        cy.get('select#filter_published').select('All');
        cy.get('select#filter_published').trigger('All');

        cy.get('a').contains(imageTitle).should('not.exist');

    })

})
