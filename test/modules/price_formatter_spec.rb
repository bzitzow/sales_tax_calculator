require_relative '../spec_helper'

describe PriceFormatter do
  describe '#format' do
    it 'enforces two decimal float' do
      extend PriceFormatter
      expect(format 1.1234567).to eql 1.12
      expect(format 1.00).to eql 1.00
    end
  end
end