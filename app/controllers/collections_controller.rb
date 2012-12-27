class CollectionsController < ApplicationController

	def index
		@collections = Collection.all
	end

	def show
		@collection = Collection.find(params[:id])
		@looks = Look.where(:collection_id => @collection.id)
	end

	def new
  @collection = Collection.new
  1.times { @collection.looks.build }
  end

  def create
  	@collection = Collection.new(params[:collection])
  	if @collection.save
  		flash[:notice] = "Your collection has been uploaded."
  		redirect_to @collection
  	else
  		render :action => 'new'
  	end
  end

  def edit
  	@collection = Collection.find(params[:id])
  end
end
