require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @catagory = Category.new(:name => "Category_test")
    end

    it 'Should have a name' do
      expect(Product.new).to be_a Product
    end

    it 'Should be valid' do
      product = Product.new(:name => "plant1", :price_cents => 100, :quantity => 10, :category => @catagory)
      expect(product).to be_valid
    end

    it 'Should not be valid without name' do
      product = Product.new(:name => nil, :price_cents => 100, :quantity => 10, :category => @catagory)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include "Name can't be blank"
    end

    it 'Should not be valid without price' do
      product = Product.new(:name => "plant1", :price_cents => nil, :quantity => 10, :category => @catagory)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include "Price can't be blank"
    end

    it 'Should not be valid without quantity' do
      product = Product.new(:name => "plant1", :price_cents => 100, :quantity => nil, :category => @catagory)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'Should not be valid without category' do
      product = Product.new(:name => "plant1", :price_cents => 100, :quantity => 10, :category => nil)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include "Category can't be blank"
    end

  end
end
