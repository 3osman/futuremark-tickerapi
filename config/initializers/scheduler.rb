require 'rufus-scheduler'
include EntryUtil
include AverageUtil
next_id = 0
loop_id = 1
cached_averages = {}
scheduler = Rufus::Scheduler::singleton

scheduler.every '5s' do
	
	entries_poller = Poller.new(next_id, 10)
	if !entries_poller.entries.nil?
		entries_entities = EntryUtil.new_entries(entries_poller.entries)
		if !entries_entities.nil?
			cached_averages = AverageUtil.handle_averages_cache(cached_averages, entries_entities)
			next_id = entries_entities.last.e_id + 1
		end
	end	
	puts "loop #{loop_id} done"
	puts "Number of Countries: #{cached_averages.size}"
	puts "=========================================="
	loop_id += 1
end



