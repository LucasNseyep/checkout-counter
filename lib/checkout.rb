require 'json'

class Checkout
  def initialize(json_file)
    file_serialized = File.read(json_file)
    file = JSON.parse(file_serialized)
    @products = file["products"]
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
    @items.each do |item|
      @sum_total += @products[item]
    end
    apply_discount!
    return @sum_total
  end

  private

  def apply_discount!
    # 2 for 1 deal for the `VOUCHER`s
    voucher_count = @items.count("VOUCHER") / 2
    @sum_total -= voucher_count * @products["VOUCHER"] if voucher_count.positive?

    # 3 or more `TSHIRT`s and the price is 19
    tshirt_count = @items.count("TSHIRT")
    @sum_total -= tshirt_count * 1 if tshirt_count > 2
  end
end
