require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'index success should show all user' do
    get api_v1_users_path as: :json
    assert_response 200
  end
end
