require 'json'
require_relative "../lib/checkout"

describe Checkout do
  json_path = './price_rules.json'
  file_serialized = File.read(json_path)
  file = JSON.parse(file_serialized)
  let(:products) { file["products"] }
  let(:checkout) { Checkout.new(json_path) }

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
    it "should update total when a stocked product is scanned" do
      expect(checkout.total).to eq(0)
      checkout.scan(products.first.first)
      expect(checkout.total).to eq(products[products.first.first])
    end
  end
end
