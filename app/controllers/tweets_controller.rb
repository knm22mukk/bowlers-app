class TweetsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def new
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def edit
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      flash[:success] = '投稿を編集しました。'
      redirect_to @tweet
    else
      flash.now[:danger] = '投稿の編集に失敗しました。'
      render :edit
    end
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      flash[:success] = '投稿しました'
      redirect_to root_url
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
    end
  end

  def destroy
    @tweet.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_to user_path
  end
  
  private
  
  def tweet_params
    params.require(:tweet).permit(:title, :content, :image)
  end
  
  def correct_user
    @tweet = current_user.tweets.find_by(id: params[:id])
    unless @tweet
      redirect_to root_url
    end
  end
end