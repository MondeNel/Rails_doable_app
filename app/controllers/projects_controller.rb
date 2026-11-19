class ProjectsController < ApplicationController
  # List all projects
  def index
    @projects = Project.all
  end

  # Show a single project
  def show
    @project = Project.find(params[:id])
  end

  # Render form for a new project
  def new
    @project = Project.new
  end

  # Save a new project
  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Project created successfully!"
      redirect_to project_path(@project) # Go to show page
    else
      render :new, status: :unprocessable_entity # Re-render new form with errors
    end
  end

  # Render form to edit an existing project
  def edit
    @project = Project.find(params[:id])
  end

  # Update an existing project
  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      flash[:notice] = "Project updated successfully!"
      redirect_to project_path(@project) # Go to show page
    else
      render :edit, status: :unprocessable_entity # Re-render edit form with errors
    end
  end

  # Delete a project

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    flash[:notice] = "Project deleted"
    redirect_to projects_path
  end


  private

  # Only allow trusted parameters through
  def project_params
    params.require(:project).permit(:name)
  end
end
