require 'test_helper'

class Operator::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operator_user = operator_users(:one)
  end

  test "should get index" do
    get operator_users_url
    assert_response :success
  end

  test "should get new" do
    get new_operator_user_url
    assert_response :success
  end

  test "should create operator_user" do
    assert_difference('Operator::User.count') do
      post operator_users_url, params: { operator_user: {  } }
    end

    assert_redirected_to operator_user_url(Operator::User.last)
  end

  test "should show operator_user" do
    get operator_user_url(@operator_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_operator_user_url(@operator_user)
    assert_response :success
  end

  test "should update operator_user" do
    patch operator_user_url(@operator_user), params: { operator_user: {  } }
    assert_redirected_to operator_user_url(@operator_user)
  end

  test "should destroy operator_user" do
    assert_difference('Operator::User.count', -1) do
      delete operator_user_url(@operator_user)
    end

    assert_redirected_to operator_users_url
  end
end
