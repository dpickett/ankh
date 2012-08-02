require 'spec_helper'

describe Ankh do
  describe 'factories' do
    class FooFactory
    end

    it 'registers a factory by adding it to the available list' do
      Ankh.register_factory(:foo, FooFactory)
      Ankh.available_factories.keys.last.should eql(:foo)
      Ankh.available_factories[:foo].should eql(FooFactory)

      Ankh.remove_factory(:foo)
    end

    it 'allows me to deregister a factory' do
      Ankh.register_factory(:foo, FooFactory)

      Ankh.remove_factory(:foo)

      Ankh.available_factories.keys.should_not include(:foo)
    end

     it 'gives me a random factory' do
       Ankh.available_factories.values.should include(Ankh.random_factory)
     end
  end
end

