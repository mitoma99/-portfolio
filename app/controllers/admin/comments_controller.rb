class Admin::CommentsController < ApplicationController
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_tweet_path(params[:tweet_id])
  end
end
