require_relative "../lib/checkout"

describe Checkout do
  let(:checkout) { Checkout.new('./price_rules.json') }

  it "has a way to access the checkout total" do
    expect(checkout.total).to eq(0)
  end
end
