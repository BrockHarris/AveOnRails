class ProjectsController < ApplicationController
	
	def new
  @project = Project.new
  end

  def create
  	@project = Project.new(params[:project])
  	if @project.save
  		flash[:notice] = "Your project has been posted."
  		redirect_to @project
  	else
  		render :action => :new
  	end
  end

	def index
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
		@submission = Submission.new(params[:submission])
		
	end

  def edit
  	@project = Project.find(params[:id])
  end
end