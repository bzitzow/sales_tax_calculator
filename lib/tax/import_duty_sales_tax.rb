class ImportDutySalesTax < SalesTaxAbstract
  def initialize
    @rate = BigDecimal.new '0.05'
    @exempt_items = default_exempt_items
  end

  def name
    "Import Duty Sales Tax"
  end


  private

  def default_exempt_items
    []
  end

  def item_is_exempt item
    (default_exempt_items.include? item.type or !item.is_imported) ? true : false
  end

end