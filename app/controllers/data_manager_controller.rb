class DataManagerController < ApplicationController
	@@cached_averages = {}

	def self.get_cached_values
    	@@cached_averages
  	end
	def index
	end

	def update_table
		@vals = @@cached_averages[params[:country]]

		render json: @vals

	end
	
end
