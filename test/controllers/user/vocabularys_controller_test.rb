require 'test_helper'

class User::VocabulariesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_vocabularies_new_url
    assert_response :success
  end

end
