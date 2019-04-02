require 'test_helper'

class Operator::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get operator_sessions_new_url
    assert_response :success
  end

end
