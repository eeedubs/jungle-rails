require 'rails_helper'

RSpec.describe Product, type: :model do
  cat1 = Category.new(name: "Doggos")
  product1 = Product.new(name: 'ABC', price: 180.00, quantity: 20, category: cat1)
  product2 = Product.new(name: 'DEF', price: 140.00, quantity: 43, category: cat1)
  product3 = Product.new(name: 'GHI', price: 70.00, quantity: 12, category: cat1)
  product4 = Product.new(name: 'JKL', price: 450.00, quantity: 3, category: cat1)
  product5 = Product.new(name: 'MNO', price: 235.00, quantity: 99, category: cat1)
  describe ".create" do
    context "given a valid product" do
      it "returns true" do
        expect(product1).to be_valid
      end
    end
    context "without a given name" do
      it "returns false" do
        product2.name = nil
        expect(product2).to_not be_valid
        expect(product2.errors.full_messages).to include "Name can't be blank"
      end
    end
    context "without a given price" do
      it "returns false" do
        product3.price_cents = nil
        expect(product3).to_not be_valid
        expect(product3.errors.full_messages).to include "Price cents is not a number"
      end
    end
    context "without a given quantity" do
      it "returns false" do
        product4.quantity = nil
        expect(product4).to_not be_valid
        expect(product4.errors.full_messages).to include "Quantity can't be blank"
      end
    end
    context "without a given category" do
      it "returns false" do
        product5.category = nil
        expect(product5).to_not be_valid
        expect(product5.errors.full_messages).to include "Category can't be blank"
      end
    end
  end
end
