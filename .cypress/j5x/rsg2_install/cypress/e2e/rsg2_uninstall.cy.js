describe('RSG2 uninstall without DB tables', () => {

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

    it(' "Uninstall"', () => {
        cy.log ('-----------------------------------------');
        cy.log ('uninstall RSG2');
        cy.log ('-----------------------------------------');

        cy.visit('/administrator/index.php?option=com_installer&view=manage');
        cy.get('h1').contains(' Extensions: Manage');

        cy.log ('--- prepare search for component rsgallery2 ---');

        cy.get('input#filter_search');
        cy.log ('--- input "" exists ---');
        cy.get('input#filter_search').click().type("rsgallery2");

        cy.log ('--- open "filter options" ---');

        cy.get('button').contains('Filter Options').click();

        cy.log ('--- select "component" in select type ---');

        cy.get('select#filter_type');

        cy.log ('--- do search ---');

        cy.get('select#filter_type').focus()
            .press(Cypress.Keyboard.Keys.DOWN)
            .press(Cypress.Keyboard.Keys.ENTER);
        cy.get('select#filter_type').should('have.value', 'component')

        cy.log ('--- Click on "Prepare remove of RSG2" ---');

        cy.get('input#cb0');
        cy.get('input#cb0').click();

        cy.log ('--- single element ---');
        cy.log ('--- find uninstall and click ---');

        //cy.get('button').contains(' Actions');
        cy.get('button').contains(' Actions').click();
        cy.get('button').contains(' Uninstall').click();


        cy.press(Cypress.Keyboard.Keys.ENTER);

        cy.log ('--- test is uninstalled ---');
        cy.get('.alert-heading').should('exist');
        cy.get('.alert-message').contains('Uninstalling the component was successful.');

    })

})
