class RequestsController < ApplicationController

  def new
    #need both request and project since form is nested resource
    @request = Request.new
    @project = Project.find(params[:project_id])
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to project_path(@request.project)
    else
      render :new
    end
  end

  private

  def request_params
    params.require(:request).permit(:title, :description, :user_id, :project_id)
  end
end
