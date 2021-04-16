class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    user_name = comment.user.name
    render json:{ comment: comment, user_name: user_name }
  end

  private

    def comment_params
      params.require(:comment).permit(:comment).merge(user: current_user, tweet_id: params[:tweet_id])
    end
end
