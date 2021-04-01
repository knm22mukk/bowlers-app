class BallsController < ApplicationController
  def index
    @balls = Ball.order(id: :desc).page(params[:page]).per(30)
  end

  def new
    @ball = Ball.new
  end

  def edit
    @ball = Ball.find(params[:id])
  end

  def update
    @ball = Ball.find(params[:id])
    
    if @ball.update(ball_params)
      flash[:success] = 'ボールの編集が完了しました。'
      redirect_to @ball
    else
      flash[:danger] = 'ボールの編集に失敗しました。'
      render :edit
    end
  end

  def show
    @ball = Ball.find(params[:id])
  end

  def create
    @ball = Ball.new(ball_params)
    
    if @ball.save
      flash[:success] = 'ボールの登録が完了しました。'
      redirect_to @ball
    else
      flash.now[:danger] = 'ボールの登録に失敗しました。'
      render :new
    end
  end

  def destroy
    @ball = Ball.find(params[:id])
    @ball.destroy
    flash[:success] = 'ボールを削除しました。'
    redirect_to @ball
  end
  
  private
  
  def ball_params
    params.require(:ball).permit(:name, :brand, :cost, :content, :memo, :image)
  end
end
