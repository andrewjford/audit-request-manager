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

  def show
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    if @request.update(request_params)
      redirect_to project_request_path(@request.project, @request)
    else
      render :show
    end
  end

  private

  def request_params
    params.require(:request).permit(:title, :description,:status, :request_number,
      :user_id, :project_id)
  end
end
