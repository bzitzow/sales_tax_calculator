require_relative '../spec_helper'

describe ImportDutySalesTax  do
  let (:item)                   { Product.new price: 1.00, is_imported: true }
  let (:item_quantity_two)      { Product.new price: 1.00, is_imported: true, quantity: 2 }
  let (:item_import_exempt)     { Product.new price: 1.00, type: :book }
  let (:import_duty_sales_tax)  { ImportDutySalesTax.new }

  describe '#rate' do
    it 'is 5%' do
      expect(import_duty_sales_tax.rate).to eql 0.05
    end
  end

  describe '#calculate' do
    it 'returns 0.05 on an imported product with price of 1.00' do
      expect(import_duty_sales_tax.calculate item).to eql 0.05
    end

    it 'returns 0.00 on non-imported products' do
      expect(import_duty_sales_tax.calculate item_import_exempt).to eql 0.00
    end

    it 'takes item.quantity into account' do
      expect(import_duty_sales_tax.calculate item_quantity_two).to eql 0.10
    end
  end

end