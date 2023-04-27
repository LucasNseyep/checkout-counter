require_relative 'checkout'

price_rules = './price_rules.json'

checkout = Checkout.new(price_rules)

# checkout.scan("VOUCHER")
# checkout.scan("MUG")
# checkout.scan("TSHIRT")

# checkout.scan("VOUCHER")
# checkout.scan("VOUCHER")
# checkout.scan("TSHIRT")

# checkout.scan("TSHIRT")
# checkout.scan("TSHIRT")
# checkout.scan("TSHIRT")
# checkout.scan("VOUCHER")
# checkout.scan("TSHIRT")

checkout.scan("VOUCHER")
checkout.scan("TSHIRT")
checkout.scan("VOUCHER")
checkout.scan("VOUCHER")
checkout.scan("MUG")
checkout.scan("TSHIRT")
checkout.scan("TSHIRT")

p checkout.total