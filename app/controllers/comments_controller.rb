class CommentsController < ApplicationController

  def create
    @comment = @commentable.comments.build(comments_params)  
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @commentable
  end

  def comments_params
    params.require(:comment).permit(:content,:user_id)
  end
end