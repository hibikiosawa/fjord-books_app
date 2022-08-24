class CommentsController < ApplicationController

    def create
      @comment = @commentable.comments.build(comments_params)  
      @comment.save
    end

    def comments_params
      params.require(:comment).permit(:content,:user_id)
    end
end