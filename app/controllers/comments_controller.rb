class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    authorize @comment

    if @comment.save
      render json: @comment, status: 201
      # redirect_to project_request_path(params[:project_id],params[:request_id])
    else
      @request = Request.find(params[:request_id])
      flash[:error] = "New comment must have content."
      render :template => "requests/show"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment

    @comment.destroy
    redirect_to project_request_path(params[:project_id],params[:request_id])
  end

  def show
    @comment = Comment.find(params[:id])
    render json: @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :request_id)
  end
end
