class Average < ActiveRecord::Base
	def self.columns() @columns ||= []; end
 
	def self.column(name, sql_type = nil, default = nil, null = true)
		type = "ActiveRecord::Type::#{sql_type.to_s.camelize}".constantize.new
		columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
	end

	column :current_average, :integer
	column :number_of_entries, :integer
end
