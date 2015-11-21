module AverageUtil

	def handle_averages_cache(cached_averages, entries_entities)
		entries_entities.each do |e|
			if cached_averages.has_key?(e.country_code)
				update_country_entry(cached_averages,e)
			else
				create_new_country_entry(cached_averages,e)
			end
		end
	end

	def create_new_country_entry(cached_averages, entry)
		new_avg = Average.new(number_of_entries: 1, current_average: entry.overall_score)
		cached_averages[entry.country_code] = Hash.new
		cached_averages[entry.country_code][entry.test_name] = new_avg

	end

	def update_country_entry(cached_averages, entry)
		if cached_averages[entry.country_code].has_key?(entry.test_name)

			cached_averages[entry.country_code][entry.test_name].number_of_entries += 1
			cached_averages[entry.country_code][entry.test_name].current_average = (cached_averages[entry.country_code][entry.test_name].current_average + entry.overall_score) / cached_averages[entry.country_code][entry.test_name].number_of_entries	 

		else
			cached_averages[entry.country_code][entry.test_name] = Average.new(number_of_entries: 1, current_average: entry.overall_score)
		end 
	end


	module_function :handle_averages_cache, :create_new_country_entry, :update_country_entry
end