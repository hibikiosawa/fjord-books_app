# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new(comments_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @commentable
    else
      render :render_path
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:content, :user_id)
  end
end
