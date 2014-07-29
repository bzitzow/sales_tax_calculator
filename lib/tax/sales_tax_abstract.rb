class SalesTaxAbstract
  attr_accessor :exempt_items, :rate

  include PriceFormatter

  @error_message = "Implement this method in a child class"

  def is_abstract
    raise NotImplementedError, @error_message
  end

  def calculate item
    if item_is_exempt item
      return format 0
    end

    return format round_up((item.price * item.quantity) * @rate)
  end

  def name
    is_abstract
  end

  def item_is_exempt item
    is_abstract
  end

  # Round up to the nearest multiple of .05
  def round_up(number)
    multiple = (number * 100).round().to_int
    (multiple % 5 == 0 ? multiple: multiple + 5 - (multiple % 5)) / 100.00
  end
end