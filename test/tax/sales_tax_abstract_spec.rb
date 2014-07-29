require_relative '../spec_helper'

shared_examples_for "SalesTaxAbstract" do
    let(:object)  { described_class.new() }

    it "implements #rate" do
      expect(object).to respond_to(:rate)
    end

    it "implements #name" do
      expect(object).to respond_to(:name)
    end

    it "implements #exempt_items" do
      expect(object).to respond_to(:exempt_items)
    end

    it "implements #calculate" do
      expect(object).to respond_to(:calculate)
    end
end

describe SalesTaxAbstract do
  let(:sales_tax_abstract) { SalesTaxAbstract.new }

  describe "#round_up" do
    it "rounds up to the nearest .05" do
      expect(sales_tax_abstract.round_up(1.13)).to eql 1.15
      expect(sales_tax_abstract.round_up(1.02)).to eql 1.05
      expect(sales_tax_abstract.round_up(1.02532409572345)).to eql 1.05
      expect(sales_tax_abstract.round_up(1.99)).to eql 2.00
      expect(sales_tax_abstract.round_up(1.997897896)).to eql 2.00
    end
  end
end

describe BasicSalesTax do
  it_behaves_like "SalesTaxAbstract"
end


