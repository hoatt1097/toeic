require 'test_helper'

class Operator::VocabulariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operator_vocabulary = operator_vocabularies(:one)
  end

  test "should get index" do
    get operator_vocabularies_url
    assert_response :success
  end

  test "should get new" do
    get new_operator_vocabulary_url
    assert_response :success
  end

  test "should create operator_vocabulary" do
    assert_difference('Operator::Vocabulary.count') do
      post operator_vocabularies_url, params: { operator_vocabulary: {  } }
    end

    assert_redirected_to operator_vocabulary_url(Operator::Vocabulary.last)
  end

  test "should show operator_vocabulary" do
    get operator_vocabulary_url(@operator_vocabulary)
    assert_response :success
  end

  test "should get edit" do
    get edit_operator_vocabulary_url(@operator_vocabulary)
    assert_response :success
  end

  test "should update operator_vocabulary" do
    patch operator_vocabulary_url(@operator_vocabulary), params: { operator_vocabulary: {  } }
    assert_redirected_to operator_vocabulary_url(@operator_vocabulary)
  end

  test "should destroy operator_vocabulary" do
    assert_difference('Operator::Vocabulary.count', -1) do
      delete operator_vocabulary_url(@operator_vocabulary)
    end

    assert_redirected_to operator_vocabularies_url
  end
end
