require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user with all valid ' do
    user = User.new({ email: 'test@test.com', password_digest: '123456', role: 1 })
    assert user.valid?
  end

  test 'valid user with illegal email ' do
    user = User.new({ email: 'test', password_digest: '123456', role: 1 })
    assert_not user.valid?
  end

  test 'valid user with illegal password' do
    user = User.new({ email: 'test@test.com', password_digest: '', role: 1 })
    assert_not user.valid?
  end

  test 'valid user with illegal role' do
    user = User.new({ email: 'test@test.com', password_digest: '123', role: 5 })
    assert_not user.valid?
  end

  test 'valid user with legal password' do
    user = User.new({ email: 'test@test.com', password: '123', role: 1 })
    assert user.valid?
  end
end
