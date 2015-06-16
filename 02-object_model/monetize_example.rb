require 'pp'
require 'forwardable'
require 'monetize'

# Gem Configuration to default to en_US
I18n.config.enforce_available_locales = false

bargain_price = Monetize.parse("USD 999")
pp bargain_price.format # => "$99.00"

standard_price = 1000.to_money("USD")
pp standard_price.format # => "$100.00"
