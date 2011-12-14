module Ankh
  class Railtie < Rails::Railtie
    initializer "ankh" do
      ActiveRecord::Base.extend Ankh::Model
    end
  end
end

