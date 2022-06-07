// inside cypress/integration/home.spec.js
describe('Testing Product page', () => {  
  
  beforeEach(() => {  
    cy.visit('/products/2')   
  }) 
  it("Visit product page 1", () => {
    cy.visit('/products/1') 
  });
  it("There should be price", () => {
    cy.get(".quantity > :nth-child(2)").should('be.visible');
  });
  
})  