require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  test "signup new user" do
    post "/users",
    params: { user: { username: "testuser1", email: "testemail@email.com", password: "testpassword" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match "Welcome testuser1", response.body
  end
end
