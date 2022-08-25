# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new(comments_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @commentable
  end

  private

  def comments_params
    params.require(:comment).permit(:content, :user_id)
  end
end
