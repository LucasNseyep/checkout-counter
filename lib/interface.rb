require_relative 'checkout'

price_rules = './price_rules.json'

checkout = Checkout.new(price_rules)

# Example cases from the problem brief

# Case 1

# checkout.scan("VOUCHER")
# checkout.scan("TSHIRT")
# checkout.scan("MUG")

# Case 2

# checkout.scan("VOUCHER")
# checkout.scan("TSHIRT")
# checkout.scan("VOUCHER")

# Case 3

# checkout.scan("TSHIRT")
# checkout.scan("TSHIRT")
# checkout.scan("TSHIRT")
# checkout.scan("VOUCHER")
# checkout.scan("TSHIRT")

# Case 4

# checkout.scan("VOUCHER")
# checkout.scan("TSHIRT")
# checkout.scan("VOUCHER")
# checkout.scan("VOUCHER")
# checkout.scan("MUG")
# checkout.scan("TSHIRT")
# checkout.scan("TSHIRT")

p checkout.total
