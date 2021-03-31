require 'test_helper'

class BallFavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get ball_favorites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get ball_favorites_destroy_url
    assert_response :success
  end

end
