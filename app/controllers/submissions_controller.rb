class SubmissionsController < ApplicationController
	def index
		@submissions = Submission.all
	end

	def show
		@submission = Submission.find(params[:id])
		@attachments = Attachment.where(:submission_id => @submission.id)
	end

	def new
  	@submission = Submission.new
  	1.times { @submission.attachments.build }
  end

  def create
  	@submission = Submission.new(params[:submission])
  	if @submission.save
  		flash[:notice] = "Your project submission has been uploaded."
  		redirect_to @submission
  	else
  		render :action => 'new'
  	end
  end

  def edit
  	@submission = Submission.find(params[:id])
  end
end
