require File.join(File.dirname(__FILE__), "validations/legacy/active_record")
require File.join(File.dirname(__FILE__), "validations/active_record")

module Ankh
  class Railtie < Rails::Railtie
    initializer "ankh" do
      unless ActiveRecord::Base.respond_to?(:validates_with)
        ActiveRecord::Base.extend Ankh::Validation::Legacy::ActiveRecord
      end
      
      ActiveRecord::Base.extend Ankh::Validations::ActiveRecord
    end
  end
end
