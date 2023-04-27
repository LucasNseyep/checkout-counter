require 'json'

class Checkout
    attr_reader :total

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
        if voucher_count.positive?
            @sum_total -= voucher_count * @products["VOUCHER"]
        end

        # 3 or more `TSHIRT`s and the price is 19
        tshirt_count = @items.count("TSHIRT")
        if tshirt_count > 2
            @sum_total -= tshirt_count * 1
        end
    end
end