# Simple retail shop interface

[![Maintainability](https://api.codeclimate.com/v1/badges/7d23569278869ef7adcc/maintainability)](https://codeclimate.com/github/bestwebua/mercadona/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/7d23569278869ef7adcc/test_coverage)](https://codeclimate.com/github/bestwebua/mercadona/test_coverage)
[![CircleCI](https://circleci.com/gh/bestwebua/mercadona/tree/master.svg?style=svg)](https://circleci.com/gh/bestwebua/mercadona/tree/master)
[![Gem Version](https://badge.fury.io/rb/mercadona.svg)](https://badge.fury.io/rb/mercadona)
[![Downloads](https://img.shields.io/gem/dt/mercadona.svg?colorA=004d99&colorB=0073e6)](https://rubygems.org/gems/mercadona)
[![GitHub](https://img.shields.io/github/license/bestwebua/mercadona)](LICENSE.txt)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v1.4%20adopted-ff69b4.svg)](CODE_OF_CONDUCT.md)

`mercadona` - Simple retail shop interface.

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
  - [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)
- [Code of Conduct](#code-of-conduct)
- [Credits](#credits)
- [Versioning](#versioning)
- [Changelog](CHANGELOG.md)

## Requirements

Ruby MRI 2.5.0+

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'mercadona'
```

And then execute:

```bash
bundle
```

Or install it yourself as:

```bash
gem install mercadona
```

## Usage

```ruby
require 'mercadona'

# Define discount rules
bogo_discount = Mercadona::Entity::DiscountRule.new(type: Mercadona::Discount::Bogo, condition: '>=', quantity: 2)
quantity_discount = Mercadona::Entity::DiscountRule.new(type: Mercadona::Discount::Quantity, condition: '>=', quantity: 3, discount: 0.5)
bulk_discount = Mercadona::Entity::DiscountRule.new(type: Mercadona::Discount::Bulk, condition: '>=', quantity: 3, discount: 1/3r)

# Define checkout with discount rules specified through product codes
checkout = Mercadona::Checkout.new(
  'GR1' => bogo_discount,
  'SR1' => quantity_discount,
  'CF1' => bulk_discount
)

# Define order items
green_tea = Mercadona::Entity::OrderItem.new(product_code: 'GR1', name: 'Green Tea', price: 3.11)
strawberries = Mercadona::Entity::OrderItem.new(product_code: 'SR1', name: 'Strawberries', price: 5.0)
coffee = Mercadona::Entity::OrderItem.new(product_code: 'CF1', name: 'Coffee', price: 11.23)

# Add order items to checkout
[green_tea, strawberries, coffee].each { |order_item| checkout.scan(order_item) }

# Calculate total amount using current discount rules
checkout.total # => "£19.34"
```

### Customization

You can define your custom discount logic. Please follow the example below:

```ruby
require 'mercadona'

class YourCustomDiscount < Mercadona::Discount::Base
  def call
    return amount_without_discount unless discount_case?

    # Your logic here...
  end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/bestwebua/mercadona>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct. Please check the [open tickets](https://github.com/bestwebua/mercadona/issues). Be sure to follow Contributor Code of Conduct below and our [Contributing Guidelines](CONTRIBUTING.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the mercadona project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).

## Credits

- [The Contributors](https://github.com/bestwebua/mercadona/graphs/contributors) for code and awesome suggestions
- [The Stargazers](https://github.com/bestwebua/mercadona/stargazers) for showing their support

## Versioning

`mercadona` uses [Semantic Versioning 2.0.0](https://semver.org)
