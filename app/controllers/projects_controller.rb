class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    # projects/1
    # projects = { "id" => "1" }
    @project = Project.find(params[:id])
  end
end
