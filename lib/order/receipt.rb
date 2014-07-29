class Receipt
  attr_reader :order

  def initialize order
    @order = order
  end

  def print
    puts '----------------------------------------'
    puts '-               Receipt                -'
    puts '----------------------------------------'
    puts ''

    @order.items.each do |item|
      tax = @order.tax_policy.calculate_tax(item)
      total = (tax + item.subtotal).round(2)
      printf "  %-1s %-30s %1.2f\n", item.quantity, item.name, total
      #puts "#{item.quantity} #{item.name} #{item.price}"
    end

    printf "\n  Sales Taxes: %1.2f\n", @order.calculate_tax.round(2)
    printf "  Total: %1.2f\n\n", @order.total.round(2)
    puts "----------------- End ------------------\n\n"
  end


end