class Entry < ActiveRecord::Base
	def self.columns() @columns ||= []; end
 
	def self.column(name, sql_type = nil, default = nil, null = true)
		type = "ActiveRecord::Type::#{sql_type.to_s.camelize}".constantize.new
		columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, type, null)
	end

	column :e_id, :integer 
	column :country_code, :string
	column :test_name, :string
	column :overall_score, :integer

	#validates_format_of :from_email, :to_email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
	#validates_length_of :message, :maximum => 500
end
