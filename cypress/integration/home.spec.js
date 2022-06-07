// inside cypress/integration/home.spec.js
describe('Testing Home page', () => {  
  
  beforeEach(() => {  
    cy.visit('/')  
  }) 
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  
})  
  