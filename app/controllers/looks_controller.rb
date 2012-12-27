class LooksController < ApplicationController

	def show
		@look = Look.find(params[:id])
	end
end
