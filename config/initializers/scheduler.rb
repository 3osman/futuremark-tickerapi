require 'rufus-scheduler'
include EntryUtil
next_id = 0
scheduler = Rufus::Scheduler::singleton

scheduler.every '5s' do
	
	entries_poller = Poller.new(next_id, 10)
	
	entries = entries_poller.entries
	entries_entities = EntryUtil.new_entries(entries)
	next_id = + 1
	
end



