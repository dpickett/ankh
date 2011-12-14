# taken from the state_machine gem
# Load TestCase helpers
require 'active_support/test_case'
require 'active_record'
require 'active_record/fixtures'

begin
  require 'active_record/test_case'
rescue LoadError
  class ActiveRecord::TestCase < ActiveSupport::TestCase
    # self.fixture_path = FIXTURES_ROOT
    self.use_instantiated_fixtures = false
    self.use_transactional_fixtures = true
  end
end

# Establish database connection
ActiveRecord::Base.establish_connection({'adapter' => 'sqlite3', 'database' => ':memory:'})
# ActiveRecord::Base.logger = Logger.new("#{File.dirname(__FILE__)}/../../active_record.log")

module ActiveRecordSpecHelper
  TABLES = [
    "posts"
  ]
  
  def create_tables
    each_table do |table_name| 
      ActiveRecord::Base.connection.create_table table_name unless table_exists?(table_name)
    end
  end
  
  def drop_tables
    each_table do |table_name| 
      ActiveRecord::Base.connection.drop_table table_name if table_exists?(table_name)
    end
  end
  
  def table_exists?(table_name)
    ActiveRecord::Base.connection.table_exists?(table_name)
  end
  
  def each_table(&block)
    TABLES.each { |table_name| block.call(table_name) }
  end
end
