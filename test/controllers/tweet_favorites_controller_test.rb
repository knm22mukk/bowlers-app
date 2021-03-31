require 'test_helper'

class TweetFavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get tweet_favorites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get tweet_favorites_destroy_url
    assert_response :success
  end

end
