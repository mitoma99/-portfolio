class Public::TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def show
  end

  def edit
  end

  def index
    @tweets = Tweet.all
  end

  def create
    tweet =  Tweet.new(tweet_params)
    tweet.save
    redirect_to tweets_path
  end

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
