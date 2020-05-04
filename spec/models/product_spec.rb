require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      @product = Product.new(name: "Fifa 20", price_cents: 500, quantity: 50, category_id: 3)
      expect(@product).to be_valid
    end

    it 'is not valid without a name' do
      @product = Product.new(name: nil, price_cents: 500, quantity: 50, category_id: 3)
      expect(@product).to_not be_valid 
    end

    it 'is not valid without a price' do
      @product = Product.new(name: "Fifa 20", price_cents: nil, quantity: 50, category_id: 3)
      expect(@product).to_not be_valid 
    end

    it 'is not valid without a quantity' do
      @product = Product.new(name: "Fifa 20", price_cents: 500, quantity: nil, category_id: 3)
      expect(@product).to_not be_valid 
    end

    it 'is not valid without a category' do
      @product = Product.new(name: "Fifa 20", price_cents: 500, quantity: 50, category_id: nil)
      expect(@product).to_not be_valid 
    end
  end
end
