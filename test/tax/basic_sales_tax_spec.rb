require_relative '../spec_helper'

describe BasicSalesTax do
  let (:item)             { Product.new price: 1.00 }
  let (:item_sales_exempt){ Product.new price: 1.00, type: :book }
  let (:basic_sales_tax)  { BasicSalesTax.new }

  describe '#rate' do
    it 'is 10%' do
      expect(basic_sales_tax.rate).to eql 0.10
    end
  end

  describe '#calculate' do
    it 'returns 0.10 on a non-exempt produce with price of 1.00' do
      expect(basic_sales_tax.calculate item).to eql 0.10
    end

    it 'returns 0.00 if item is tax exempt' do
      expect(basic_sales_tax.calculate item_sales_exempt).to eql 0.00
    end
  end

end