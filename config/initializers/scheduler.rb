require 'rufus-scheduler'
include EntryUtil
include AverageUtil
next_id = 0
loop_id = 1
scheduler = Rufus::Scheduler::singleton

scheduler.every '5s' do
	
	begin  
	
		entries_poller = Poller.new(next_id, 10)
		if !entries_poller.entries.nil?
			entries_entities = EntryUtil.new_entries(entries_poller.entries)
			if !entries_entities.nil?
				AverageUtil.handle_averages_cache(DataManagerController.get_cached_values, entries_entities)
				next_id = entries_entities.last.e_id + 1
			end
		end	
		puts "loop #{loop_id} done"
		puts "Number of Countries: #{DataManagerController.get_cached_values.size}"
		#puts "#{DataManagerController.get_cached_values.keys.join ","}"
		puts "=========================================="
		loop_id += 1
	rescue Exception => e  
	  puts e.message  
	  puts e.backtrace.inspect 
	  puts "Poller entries"
	  puts entries_poller
	  puts "Entitites"
	  puts entries_entities
	  puts "Last"
	  puts entries_entities.last 
	end 
end



