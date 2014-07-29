class TaxPolicy
  attr_accessor :taxes

  include PriceFormatter

  # taxes[]
  def initialize taxes
    @taxes = taxes
  end

  def calculate_tax item
    tax_amount = 0.00
    @taxes.each_value { |tax| tax_amount += tax.calculate(item) }

    format tax_amount
  end
end