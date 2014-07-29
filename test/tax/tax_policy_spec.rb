require_relative '../spec_helper'

describe TaxPolicy do
  let (:basic_sales_tax)        { BasicSalesTax.new }
  let (:import_duty_sales_tax)  { ImportDutySalesTax.new }
  let (:tax_policy)             { new_tax_policy }
  let (:item)                   { Product.new price: 1.00 }
  let (:imported_item)          { Product.new price: 27.99, is_imported: true }

  describe '#calculate_tax' do
    it 'returns total applicable tax amount per item' do
      expect(tax_policy.calculate_tax item).to eq 0.10
      expect(tax_policy.calculate_tax imported_item).to eql 4.20
    end
  end

  def new_tax_policy
    basic_sales_tax.rate = 0.10
    import_duty_sales_tax.rate = 0.05
    TaxPolicy.new basic_sales_tax: basic_sales_tax, import_duty_sales_tax: import_duty_sales_tax
  end

end
