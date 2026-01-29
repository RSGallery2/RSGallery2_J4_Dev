describe('RSG2 visit all site views (SEF)', () => {

//     beforeEach(() => {
//
// // 	cy.visit('/');
//
// // 	//--- select upload view ----------------------------------
//
// // 	cy.visit('/j3x-root-galleries');
//     });

    it('Enter all views (at once) ', function () {

        cy.viewport(1200, 1100);
        cy.visit('/');

        cy.get('h1').should('exist');
        cy.get('h1').contains(' Home ').should('exist');

        cy.get('.alert-heading').should('not.exist');

        cy.log('HOME found');

        //--- J3x menu views -----------------------------------------

        cy.get('a[href="/cypress_5x/index.php?option=com_rsgallery2&view=rootgalleriesj3x&id=0&Itemid=296"]').should('have.text', '[J3x] Root galleries ');
        cy.get('a[href="/cypress_5x/index.php?option=com_rsgallery2&view=rootgalleriesj3x&id=0&Itemid=296"]').click();
        // Wait for visual check
        cy.wait(2000);

        cy.get('a[href="/cypress_5x/index.php?option=com_rsgallery2&view=galleryj3x&id=23&Itemid=297"]').should('have.text', '[J3x] Single gallery ');
        cy.get('a[href="/cypress_5x/index.php?option=com_rsgallery2&view=galleryj3x&id=23&Itemid=297"]').click();
        // Wait for visual check
        cy.wait(2000);

        cy.get('a[href="/cypress_5x/index.php?option=com_rsgallery2&view=slideshowj3x&id=23&Itemid=298"]').should('have.text', '[J3x] Slideshow');
        cy.get('a[href="/cypress_5x/index.php?option=com_rsgallery2&view=slideshowj3x&id=23&Itemid=298"]').click();
        // Wait for visual check
        cy.wait(2000);

        cy.get('a[href="/cypress_5x/index.php?option=com_rsgallery2&view=slidepagej3x&id=23&Itemid=356"]').should('have.text', '[J3x] Slide page');
        cy.get('a[href="/cypress_5x/index.php?option=com_rsgallery2&view=gallery&id=23&Itemid=357"]').should('have.text', 'RSG2 Single Gallery');
        // Wait for visual check
        cy.wait(2000);

    });

});
