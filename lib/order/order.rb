class Order
  attr_reader :tax_policy

  include PriceFormatter

  def initialize(args)
    @tax_policy = args[:tax_policy]
    @items = args[:items] || []
  end

  def add_item item
    @items.push(item)
  end

  def items
    @items
  end

  def calculate_tax
    total_tax = 0.00
    @items.each { |item| total_tax += @tax_policy.calculate_tax item }
    format total_tax
  end

  def total
    total = 0.00
    @items.each { |item| total += (@tax_policy.calculate_tax item) + (item.price * item.quantity) }
    format total
  end
end