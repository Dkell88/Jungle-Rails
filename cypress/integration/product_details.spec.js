// inside cypress/integration/home.spec.js
describe('Testing Product page', () => {  
  
  beforeEach(() => {  
    cy.visit('/')   
  }) 

  it("Should navigate to product page", () => {
    
    cy.get('.products article').first().click()
  
  });
  
})  