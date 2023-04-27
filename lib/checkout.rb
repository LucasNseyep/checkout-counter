require 'json'

class Checkout
  def initialize(json_file)
    file_serialized = File.read(json_file)
    file = JSON.parse(file_serialized)
    @products = file["products"]
    @discounts = file["discounts"]
    @items = []
    @sum_total = 0
  end

  def scan(item)
    if @products[item]
      @items.append(item)
    else
      return "Sorry, we don't stock that item :("
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
        puts discount[1]["product"]
        product_count = @items.count(discount[0])
        @sum_total -= product_count * discount[1]["amount"] if product_count >= discount[1]["units"]
      elsif discount[1]["type"] == "2=1"
        product_count = @items.count(discount[0]) / 2
        @sum_total -= product_count * @products[discount[0]] if product_count.positive?
      end
    end
  end
end
