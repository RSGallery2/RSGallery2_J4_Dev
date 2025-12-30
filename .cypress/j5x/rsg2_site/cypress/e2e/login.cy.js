const login = (name, password) => {
  cy.session([name, password], () => {
    cy.visit('/login')
    cy.get('[data-test=name]').type(name)
    cy.get('[data-test=password]').type(password)
    cy.get('#submit').click()
    cy.url().should('contain', '/home')
  })
}
