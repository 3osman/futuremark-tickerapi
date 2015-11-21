module EntryUtil
	def new_entries(new_entries)
		new_entries = new_entries.parsed_response
		new_entry_entities = []
		new_entries.each do |e|
			
			entry = Entry.new(e_id: (e["id"]).to_i, country_code: e["benchmarkRunModel"]["countryCode"], overall_score: e["benchmarkRunModel"]["overallScore"], test_name: e["benchmarkRunModel"]["testName"])
				
			if entry.valid?

				new_entry_entities.push entry
			else
				puts "entry not valid"
				puts e["id"]
				puts e["benchmarkRunModel"]["countryCode"]
				puts e["benchmarkRunModel"]["overallScore"]
				puts e["benchmarkRunModel"]["testName"]
				puts "=============="
				
			end
		end
		return new_entry_entities

	end
	module_function :new_entries
end