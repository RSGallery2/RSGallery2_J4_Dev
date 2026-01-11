export class loginBackend {

    username: string
    password: string
    log_in: string

    constructor() {
        this.username = '[name="username"]'
        this.password = '[name="passwd"]'
        this.log_in = '#btn-login-submit'
    }

    /**
     * opens a login page
     */
    public visitAdmin(): void {

        cy.visit('/administrator/index.php')
    }

    visitRsg2(): void {

        cy.visit('/administrator/index.php')
    }

    /**
     * fills in username, password and submits form
     * @param username username of user to log in
     * @param pass password of the user
     */
    // login(username: string, pass: string) {
    //
    //   cy.get(this.username).type(username)
    //   cy.get(this.password).type(pass)
    //   cy.get(this.log_in).click()
    // }

    /**
     * fills in environment username, password and submits form
     */
    loginAdmin(): void {

        let username: string = Cypress.env("login_name")
        let pass: string = Cypress.env("login_pass");

        cy.get(this.username).type(username)
        cy.get(this.password).type(pass)
        cy.get(this.log_in).click()
    }

}