require_relative 'test/spec_helper'

class SalesTaxCalculator

  def initialize
    @tax_policy = TaxPolicy.new({ basic_sales_tax: BasicSalesTax.new, import_duty_sales_tax: ImportDutySalesTax.new })

    demo_input_one
    demo_input_two
    demo_input_three
    demo_additional
  end

  def demo_input_one
    order = Order.new tax_policy: @tax_policy
    order.add_item Product.new({ name: 'book', price: 12.49, type: :book })
    order.add_item Product.new({ name: 'music CD', price: 14.99 })
    order.add_item Product.new({ name: 'chocolate bar', price: 0.85, type: :food })

    Receipt.new(order).print
  end

  def demo_input_two
    order = Order.new tax_policy: @tax_policy
    order.add_item Product.new({ name: 'box of chocolates', price: 10.00, type: :food, is_imported: true })
    order.add_item Product.new({ name: 'bottle of perfume', price: 47.50, is_imported: true})

    Receipt.new(order).print
  end

  def demo_input_three
    order = Order.new tax_policy: @tax_policy
    order.add_item Product.new({ name: 'imported bottle of perfume', price: 27.99, is_imported: true })
    order.add_item Product.new({ name: 'bottle of perfume', price: 18.99 })
    order.add_item Product.new({ name: 'packet of headache pills', price: 9.75, type: :medical })
    order.add_item Product.new({ name: 'imported box of chocolates', price: 11.25, type: :food, is_imported: true })

    Receipt.new(order).print
  end

  def demo_additional
    order = Order.new tax_policy: @tax_policy
    order.add_item Product.new({ name: 'JetBrains (RubyMine)', price: 199.00, quantity: 5 })
    order.add_item Product.new({ name: 'Apple MacBook Pro (imported)', price: 2469.99, is_imported: true })
    order.add_item Product.new({ name: 'BulletProof Coffee (medical)', price: 80.00, type: :medical })
    order.add_item Product.new({ name: 'Clean Code by Robert Martin', price: 32.00, type: :book })

    Receipt.new(order).print
  end
end

SalesTaxCalculator.new
