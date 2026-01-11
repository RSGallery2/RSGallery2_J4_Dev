describe('Delete gallery test', () => {

    let galleryName = "cy test";

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

        //--- visit gallery list ----------------------------------

        cy.visit('/administrator/index.php?option=com_rsgallery2&view=galleries');
        cy.get('h1').contains(' Manage galleries');
        cy.get('h1 > span.icon-images'); // Manage galleries

        cy.get('.alert-heading').should('not.exist');

        //--- select show all ----------------------------------

        cy.get('select#list_limit').select('All');

        // gallery should exist
        cy.get('a').contains(galleryName).should('exist');

    })

    it('delete gallery', () => {

        //-----------------------------------------------------
        //--- thrash gallery ----------------------------------
        //-----------------------------------------------------

        cy.log('--- Thrash gallery ---------------------------------- ');

        //--- select gallery ----------------------------------
        cy.log('--- Select gallery ');

        // go parent up to tr (row) , then siblings find child with class '.icon-edit'
        cy.get('a').contains(galleryName)
            .parent().parent()
            .find('[name="cid[]"]')
            .click();

        //--- Actions trash ----------------------------------

        cy.log('--- Actions trash ');
        cy.get('button.dropdown-toggle:visible').contains(" Actions").should('exist');
        cy.get('button.dropdown-toggle:visible').contains(" Actions").click();

        cy.get('#status-group-children-trash').should('exist');
        cy.get('#status-group-children-trash').click();

        //--- check gallery is thrashed ----------------------------------

        cy.log('--- check message gallery is thrashed');
        cy.get('.alert-message').should('have.text', '1 items successfully trashed');

        //--- select show all ----------------------------------

        cy.get('select#list_limit').select('All');

        //--- check if gallery is trashed ----------------------------------

        cy.log('--- check gallery is thrashed and can not be seen');
        cy.get('a').contains(galleryName).should('not.exist');

        //-----------------------------------------------------
        //--- delete gallery ----------------------------------
        //-----------------------------------------------------

        cy.log('--- Delete gallery ---------------------------------- ');

        //--- Select trash view ----------------------------------

        cy.log('--- Select trash view ');
        cy.get('button.filter-search-actions__button').contains("Filter Options").should('exist');
        // cy.get('button.filter-search-actions__button').trigger('click');
        cy.get('button.filter-search-actions__button').contains("Filter Options").click();

        cy.get('select#filter_published').should('exist');
        cy.get('select#filter_published').trigger('click');
        cy.get('select#filter_published').select('Trashed');
        cy.get('select#filter_published').trigger('Trashed');

        // gallery should exist
        cy.get('a').contains(galleryName).should('exist');

        //--- select gallery ----------------------------------

        cy.log('--- Select gallery (trashed) ');

        // go parent up to tr (row) , then siblings find child with class '.icon-edit'
        cy.get('a').contains(galleryName)
            .parent().parent()
            .find('[name="cid[]"]')
            .click();

        //--- Delete trashed gallery ----------------------------------

        cy.log('--- Delete gallery (trashed) ');
        cy.get('#toolbar-delete').should('exist');
        cy.get('#toolbar-delete').click();

        cy.log('--- Confirm Delete gallery ');

        cy.wait(50).debug();
        cy.get('button').contains("Yes").should('exist');
        cy.get('button').contains("Yes").click();
        cy.on('window:confirm', () => true);

        cy.log('--- check message gallery is deleted');
        cy.get('.alert-message').should('have.text', '1 items successfully deleted');

        //--- Select all visible ----------------------------------

        cy.log('--- Select all visible ');
        // cy.get('button.filter-search-actions__button').should('exist');
        // cy.get('button.filter-search-actions__button').click();

        cy.get('select#filter_published').should('exist');
        cy.get('select#filter_published').trigger('click');
        cy.get('select#filter_published').select('All');
        cy.get('select#filter_published').trigger('All');

        cy.get('a').contains(galleryName).should('not.exist');

    })

})
