class Public::TweetsController < ApplicationController
  def new
    @tweet=Tweet.new
  end

  def show
    @tweet=Tweet.find(params[:id])
    # コメントも表示
    @comment=Comment.new
  end

  def index
    @tweets=Tweet.all.order(created_at: :desc).page(params[:page]).per(4)
  end

  def create
    @tweet=Tweet.new(tweet_params)
    # つぶやきを会員に紐付け（ログインユーザー）
    @tweet.customer_id=current_customer.id
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def destroy
    tweet=Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :message)
  end
end
