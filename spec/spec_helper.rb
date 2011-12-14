$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'support/active_record_spec_helper'

ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../dummy/config/environment.rb",  __FILE__)

require 'ankh'
require 'rspec'
require 'mocha'

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

RSpec.configure do |config|
  config.include ActiveRecordSpecHelper
  
  config.before(:all) do
    create_tables
  end
  
  config.after(:all) do
    drop_tables
  end
  
  config.mock_with :mocha
end
