class Public::TweetsController < ApplicationController
  def new
    @tweet=Tweet.new
  end

  def show
    @tweet=Tweet.find(params[:id])
    @comment=Comment.new
  end

  def index
    @tweets=Tweet.all
  end

  def create
    tweet=Tweet.new(tweet_params)
    tweet.customer_id=current_customer.id
    tweet.save
    redirect_to tweets_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :message)
  end
end
