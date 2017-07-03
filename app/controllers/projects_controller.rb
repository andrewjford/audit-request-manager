class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = policy_scope(Project)
    ### reasons for not using the code below?

    # if current_user.admin? || current_user.manager?
    #   @projects = Project.all
    # else
    #   @projects = current_user.projects
    # end
  end

  def show
    authorize @project
    set_request_list(params, @project)
  end

  def new
    @project = Project.new
    authorize @project
  end

  def edit
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    authorize @project

    @project.users << current_user

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @project
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @project
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title,:auditee,user_ids:[],user_attributes: [:email])
    end

    def set_request_list(params,project)
      if !params[:status_code]
        @requests = project.requests
      elsif params[:status_code] == "open"
        @requests = project.requests.where(status: 'Open')
      elsif params[:status_code] == "client_submitted"
        @requests = project.requests.where(status: 'Client Submitted')
      elsif params[:status_code] == "closed"
        @requests = project.requests.where(status: 'Closed')
      else
        @requests = project.requests
      end
    end
end
