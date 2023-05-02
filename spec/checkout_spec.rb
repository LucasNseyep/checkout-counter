require 'json'
require_relative "../lib/checkout"

describe Checkout do
  let(:checkout) { Checkout.new('./price_rules.json') }

  it "Checkout constructor should take exactly one parameter" do
    initialize_parameters_count = Checkout.allocate.method(:initialize).arity
    expect(initialize_parameters_count).to eq(1)
  end

  describe "#total (instance method)" do
    it "should return the checkout total" do
      expect(checkout).to respond_to :total
      expect(checkout.total).to eq(0)
    end
  end

  describe "#scan (instance method)" do
    it "should update scanned total" do
      expect(checkout.total).to eq(0)
      # this is assuming that "TSHIRT will always be a product"
      checkout.scan("TSHIRT")
      expect(checkout.total).to eq(20)
    end
  end
end
