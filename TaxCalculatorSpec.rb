require './TaxCalculator'

tax_calculator = TaxCalculator.new(10)

RSpec.describe do
  it "can calculate tax" do
    first = tax_calculator.net_amount(Pair.new(40, "GBP"), Pair.new(50, "GBP") , Pair.new(60, "GBP"))
    expect(first.first).to eq 135
  end

  it "cannot sum different currencies" do
    expect {tax_calculator.net_amount(Pair.new(40, "GBP"), Pair.new(50, "USD"))}.to raise_error(Incalculable)
  end
end