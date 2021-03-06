require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @user2 = users(:two)
  end

  test 'index success should show all user' do
    get api_v1_users_path,
        headers: { Authorization: JsonWebToken.encode({ user_id: @user.id }) },
        as: :json
    assert_response 200
  end
  test 'show success should show one user' do
    get api_v1_user_path(@user), as: :json
    json_response = JSON.parse(self.response.body)
    assert_response 200
    assert_equal @user.email, json_response['data']['email']
  end

  test 'create success should create a user' do
    assert_difference('User.count', 1) do
      post api_v1_users_path,
           params: { user: { email: 'demo@demo.com', password: '123', role: 1 } },
           as: :json
    end
    assert_response 201
  end

  test 'update success should change user information' do
    put api_v1_user_path(@user),
        params: { user: { email: 'user1@mail.com', password: '123456' } },
        headers: { Authorization: JsonWebToken.encode({ user_id: @user.id }) },
        as: :json
    assert_response 202
  end

  test 'destroy success should delete a user' do
    assert_difference('User.count', -1) do
      delete api_v1_user_path(@user),
             headers: { Authorization: JsonWebToken.encode(user_id: @user.id) },
             as: :json
    end
    assert_response 204
  end

end
