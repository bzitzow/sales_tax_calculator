require_relative '../spec_helper'

describe Order do
  let(:basic_sales_tax)       { BasicSalesTax.new }
  let(:import_duty_sales_tax) { ImportDutySalesTax.new }
  let(:tax_policy)            { new_tax_policy }
  let(:import_product)        { Product.new price: 1.00, type: :book, is_imported: true }
  let(:sales_tax_product)     { Product.new price: 1.00 }
  let(:tax_exempt_product)    { Product.new price: 1.00, type: :book }

  let(:order)                 { Order.new({tax_policy: tax_policy})}

  describe '#add_item' do
    it 'adds a product to the order object' do
      order.add_item import_product
      expect(order.items.count).to eql 1

      order.add_item sales_tax_product
      expect(order.items.count).to eql 2
    end
  end

  describe '#calculate_tax' do
    it 'given price 1.00 returns 0.00 for tax exempt, non-import items' do
      order.add_item tax_exempt_product
      expect(order.calculate_tax).to eql 0.00
    end

    it 'given price 1.00 returns 0.10 for non-exempt, non-import items' do
      order.add_item sales_tax_product
      expect(order.calculate_tax).to eql 0.10
    end

    it 'given price 1.00 returns 0.05 for exempt, import items' do
      order.add_item import_product
      expect(order.calculate_tax).to eql 0.05
    end
  end

  describe '#total' do
    it 'sums tax and item price' do
      order.add_item sales_tax_product
      expect(order.total).to eql 1.10
    end

    it 'sums multiple items taxes and price' do
      order.add_item sales_tax_product
      order.add_item sales_tax_product
      expect(order.total).to eql 2.20
    end

    it 'is inclusive of item.quantity' do
      sales_tax_product.quantity = 10
      order.add_item sales_tax_product
      expect(order.total).to eql 11.00
    end
  end

  def new_tax_policy
    basic_sales_tax.rate = 0.10
    import_duty_sales_tax.rate = 0.05
    TaxPolicy.new basic_sales_tax: basic_sales_tax, import_duty_sales_tax: import_duty_sales_tax
  end
end