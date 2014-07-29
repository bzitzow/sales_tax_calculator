class Product
  attr_accessor :price, :type, :is_imported, :name, :quantity

  def initialize(args = {})
    @price    = args[:price]    || 0.00
    @type     = args[:type]     || nil
    @name     = args[:name]     || ''
    @quantity = args[:quantity] || 1
    @is_imported = args[:is_imported] || false
  end

  def subtotal
    self.price * self.quantity
  end

end