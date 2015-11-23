class DataManagerController < ApplicationController

	
	@@cached_averages = {}
	@@count = 1

	def self.get_cached_values
    	@@cached_averages
  	end
  	def self.get_count
    	@@count
  	end
  	def self.set_count(num)
    	@@count = num
  	end

	def index
	end

	def update_table
		@vals = @@cached_averages[params[:country]]

		render json: @vals

	end
	def country_values
		freq = {}
		@@cached_averages.each do |k,v|
			freq[k] =  @@cached_averages[k].length
		end
		@to_send = Hash.new
		@to_send["count"] = @@count
		@to_send["freq"] = freq
		render json: @to_send

	end
	
end
