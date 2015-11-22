require 'rufus-scheduler'
include EntryUtil
include AverageUtil
next_id = 0
scheduler = Rufus::Scheduler::singleton

scheduler.every '5s' do
	
	begin  
	
		entries_poller = Poller.new(next_id, 10)
		if !entries_poller.entries.nil?
			entries_entities = EntryUtil.new_entries(entries_poller.entries)
			if !entries_entities.nil?
				next_id = entries_entities.last.e_id + 1
				AverageUtil.handle_averages_cache(DataManagerController.get_cached_values, entries_entities)
			end
		end
		count = DataManagerController.get_count
		puts "loop #{count} done"
		puts "Number of Countries: #{DataManagerController.get_cached_values.size}"
		puts "#{next_id}"#puts "#{DataManagerController.get_cached_values.keys.join ","}"
		puts "=========================================="
		DataManagerController.set_count(count + 1)
	rescue Exception => e

	  puts e.message  
	  puts "Poller entries"
	  puts entries_poller
	  puts "Entitites"
	  puts entries_entities
	  puts "Next ID"
	  puts next_id 
	  puts "=========================================="

	end 
end



