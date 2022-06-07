describe('Testing Cart page', () => {  
  
  beforeEach(() => {  
    cy.visit('/')   
  }) 

  it("Should navigate to product page click on add and ensure cart updates", () => {
    
    cy.get('.products article').first().click()
    cy.get('.btn').click()
    cy.get('.end-0 > .nav-link').should('include.text', 'My Cart (1)')
   });
 
})  