module PriceFormatter
  def format amount
    ('%.2f' % amount.to_s).to_f
  end
end