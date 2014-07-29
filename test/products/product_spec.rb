require_relative '../spec_helper'

describe Product do
  let(:product_imported)  { Product.new is_imported: true }
  let(:product)           { Product.new }

  describe "#is_imported" do
    it 'returns a boolean' do
      expect(product_imported.is_imported).is_a? FalseClass
      expect(product.is_imported).is_a? TrueClass
    end
  end

  describe '#new' do
    it 'has default values' do
      expect(product.name).to eql ''
      expect(product.quantity).to eql 1
      expect(product.is_imported).to eql false
      expect(product.type).to eql nil
      expect(product.price).to eql 0.00
    end
  end

  describe '#quantity' do
    it 'can be increased' do
      product.quantity = 99
      expect(product.quantity).to eql 99
    end
  end

  describe '#subtotal' do
    it 'is the product of quantity and price' do
      product.quantity = 10
      product.price = 100
      expect(product.subtotal).to eql 1000
    end
  end

end