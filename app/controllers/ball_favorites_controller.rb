class BallFavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    ball = Ball.find(params[:ball_id])
    current_user.favball(ball)
    flash[:success] = 'お気に入りに追加しました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    ball = Ball.find(params[:ball_id])
    current_user.unfavball(ball)
    flash[:success] = 'お気に入りを外しました'
    redirect_back(fallback_location: root_path)
  end
end
