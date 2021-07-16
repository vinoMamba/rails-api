require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user with all valid ' do
    user = User.new({ email: 'test@test.com', password_digest: '123456', role: 1 })
    assert user.valid?
  end
end
