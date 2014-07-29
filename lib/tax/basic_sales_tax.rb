class BasicSalesTax < SalesTaxAbstract
  def initialize
    @rate = BigDecimal.new '0.10'
    @exempt_items = default_exempt_items
  end

  def name
    "Sales Tax"
  end


  private

  def default_exempt_items
    [:book, :food, :medical]
  end

  def item_is_exempt item
    default_exempt_items.include? item.type || false
  end

end