class RequestsController < ApplicationController

  def new
    #need both request and project since form is nested resource
    @request = Request.new
    authorize @request
    @project = Project.find(params[:project_id])
  end

  def create
    @request = Request.new(request_params)
    authorize @request

    if @request.save
      redirect_to project_path(@request.project)
    else
      render :new
    end
  end

  def show
    @request = Request.find(params[:id])
    authorize @request
  end

  def update
    @request = Request.find(params[:id])

    if @request.update_attributes(permitted_attributes(@request))
      redirect_to project_request_path(@request.project, @request)
    else
      render :show
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to project_path(params[:project_id])
  end

  private

  def request_params
    params.require(:request).permit(:title, :description,:status, :request_number,
      :user_id, :project_id)
  end
end
