class ProjectsController < ApplicationController
  # List all projects
  def index
    @projects = Project.all
  end

  # Show a single project (e.g., /projects/1)
  def show
    @project = Project.find(params[:id])
  end

  # Render the form for a new project
  def new
    @project = Project.new
  end

  # Save the new project to the database
  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to project_path(@project) # Redirect to the show page on success
    else
      render :new, status: :unprocessable_entity # Re-render form with errors on failure
    end
  end

  # Edit the existing project
  def edit
    @project = Project.find(params[:id]) # we find the show id of the project
  end

  # Update action
  def update
      @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to project_path(@project) # Redirect to the show page on success
    else
      render :new, status: :unprocessable_entity # Re-render form with errors on failure
    end
  end


  private

  # Only allow trusted parameters through
  def project_params
    params.require(:project).permit(:name)
  end
end
