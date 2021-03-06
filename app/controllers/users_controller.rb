class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :followings, :followers, :favtweets, :favballs]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order(id: :desc).page(params[:page])
    @followings = @user.followings.page(params[:page])
    @followers = @user.followers.page(params[:page])
    @favtweets = @user.favtweets.page(params[:page])
    @favballs = @user.favballs.page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = '新規登録が完了しました'
      redirect_to login_path
    else
      flash.now[:danger] = '新規登録に失敗しました'
      render :new
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
      if @user.update(user_params)
        flash[:success] = 'ユーザー情報を編集しました'
        redirect_to @user
      else
        flash.now[:danger] = 'ユーザーの編集に失敗しました'
        render :edit
      end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'ユーザーを削除しました。'
    redirect_to root_url
  end
  
  private

  def correct_user
    @user = current_user == User.find(params[:id]) ? current_user : nil
    unless @user
      redirect_to root_url
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduce, :image, :dominant_arm, :image_cache)
  end
end
