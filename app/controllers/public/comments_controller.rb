class Public::CommentsController < ApplicationController

  def create
   #つぶやきにコメントを紐づけるため
   tweet=Tweet.find(params[:tweet_id])
   #つぶやきにコメントを投稿するため
   comment=current_customer.comments.new(comment_params)
   comment.tweet_id=tweet.id
   comment.save
   redirect_to tweet_path(tweet)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to tweet_path(params[:tweet_id])
  end

 private

  def comment_params
   params.require(:comment).permit(:message)
  end

end
