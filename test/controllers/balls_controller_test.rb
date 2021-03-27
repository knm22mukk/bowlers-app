require 'test_helper'

class BallsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get balls_index_url
    assert_response :success
  end

  test "should get new" do
    get balls_new_url
    assert_response :success
  end

  test "should get edit" do
    get balls_edit_url
    assert_response :success
  end

  test "should get update" do
    get balls_update_url
    assert_response :success
  end

  test "should get show" do
    get balls_show_url
    assert_response :success
  end

  test "should get create" do
    get balls_create_url
    assert_response :success
  end

  test "should get destroy" do
    get balls_destroy_url
    assert_response :success
  end

end
