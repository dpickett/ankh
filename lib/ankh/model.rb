module Ankh
  module Model
    def self.included(base)
      base.extend ClassMethods
      base.send(:attr_accessor, :human_answer)
    end
    
    module ClassMethods
    end
  end
end

ActiveRecord::Base.extend(Ankh::Validations::HelperMethods)