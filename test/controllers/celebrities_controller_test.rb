require 'test_helper'

class CelebritiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get celebrities_index_url
    assert_response :success
  end

  test "should get show" do
    get celebrities_show_url
    assert_response :success
  end

  test "should get create" do
    get celebrities_create_url
    assert_response :success
  end

  test "should get update" do
    get celebrities_update_url
    assert_response :success
  end

  test "should get destroy" do
    get celebrities_destroy_url
    assert_response :success
  end

end
