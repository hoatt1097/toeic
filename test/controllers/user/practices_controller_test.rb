require 'test_helper'

class User::PracticesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_practices_index_url
    assert_response :success
  end

end
