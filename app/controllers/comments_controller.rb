class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to project_request_path(params[:project_id],params[:request_id])
    else
      render "request#show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :request_id)
  end
end
