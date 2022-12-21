class Admin::TweetsController < ApplicationController
  def show
    @tweet=Tweet.find(params[:id])
  end

  def index
    @tweets=Tweet.all.order(created_at: :desc)
  end

  def destroy
    tweet=Tweet.find(params[:id])
    tweet.destroy
    redirect_to admin_tweets_path
  end
end
