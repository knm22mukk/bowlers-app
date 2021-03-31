class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  def counts(user)
    @count_tweets = user.tweets.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    @count_favtweets = user.favtweets.count
    @count_favballs = user.favballs.count
  end
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
