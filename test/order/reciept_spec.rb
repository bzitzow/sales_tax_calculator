require_relative '../spec_helper'

describe Receipt do
  let(:basic_sales_tax)       { BasicSalesTax.new }
  let(:import_duty_sales_tax) { ImportDutySalesTax.new }
  let(:tax_policy)            { new_tax_policy }
  let(:order)                 { Order.new({tax_policy: tax_policy})}

  let(:receipt)               { Receipt.new order }
  let(:receipt_with_six_items){ Receipt.new order_with_six_items }

  describe '#print' do
    it 'displays to stdout' do
      expect{ receipt.print }.to output.to_stdout
    end

    it 'displays every item in the order' do
      expect{ receipt_with_six_items.print }.to output(/Item 1/).to_stdout
      expect{ receipt_with_six_items.print }.to output(/Item 2/).to_stdout
      expect{ receipt_with_six_items.print }.to output(/Item 3/).to_stdout
      expect{ receipt_with_six_items.print }.to output(/Item 4/).to_stdout
      expect{ receipt_with_six_items.print }.to output(/Item 5/).to_stdout
      expect{ receipt_with_six_items.print }.to output(/Item 6/).to_stdout
      expect{ receipt_with_six_items.print }.to_not output(/Item 7/).to_stdout
    end

    it 'displays the order total' do
      expect{ receipt_with_six_items.print }.to output(/Total: 6.60/).to_stdout
    end

    it 'displays the tax total' do
      expect{ receipt_with_six_items.print }.to output(/Sales Taxes: 0.60/).to_stdout
    end

  end

  def order_with_six_items
    six_items = []
    (1..6).each {|number| six_items.push Product.new({ name: "Item #{number}", price: 1.00 })}
    Order.new({tax_policy: tax_policy, items: six_items})
  end

  def new_tax_policy
    basic_sales_tax.rate = 0.10
    import_duty_sales_tax.rate = 0.05
    TaxPolicy.new({basic_sales_tax: basic_sales_tax, import_duty_sales_tax: import_duty_sales_tax})
  end

end