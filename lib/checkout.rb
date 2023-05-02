require 'json'

class Checkout
  def initialize(json_file)
    file_serialized = File.read(json_file)
    file = JSON.parse(file_serialized)
    @products = file["products"] # hash where the keys are the product codes and the values their price
    @discounts = file["discounts"] # hash of hashes with the discounts
    @items = []
    @sum_total = 0
  end

  def scan(item)
    if @products[item]
      @items.append(item)
    else
      return 404
    end
  end

  def total
    calculate_subtotal!
    apply_product_discounts!
    return @sum_total
  end

  private

  def calculate_subtotal!
    @items.each do |item|
      @sum_total += @products[item]
    end
  end

  def apply_product_discounts!
    @discounts["product_discounts"].each do |discount|
      if discount[1]["type"] == "1=1"
        product_count = @items.count(discount[1]["product"])
        @sum_total -= product_count * discount[1]["amount"] if product_count >= discount[1]["units"]
      elsif discount[1]["type"] == "n=1"
        product_count = @items.count(discount[1]["product"]) / discount[1]["units"]
        @sum_total -= product_count * @products[discount[1]["product"]] if product_count.positive?
      end
    end
  end
end
