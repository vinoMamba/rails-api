require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  test "valid: shop with all valid " do
    shop = Shop.new(name: 'shopTest1', products_count: 0, orders_count: 1)
    shop.user = users(:one)
    assert_not shop.valid?
  end
end
