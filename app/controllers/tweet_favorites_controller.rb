class TweetFavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    tweet = Tweet.find(params[:tweet_id])
    current_user.favtweet(tweet)
    flash[:success] = 'いいねしました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    tweet = Tweet.find(params[:tweet_id])
    current_user.unfavtweet(tweet)
    flash[:success] = 'いいねを外しました'
    redirect_back(fallback_location: root_path)
  end
end
