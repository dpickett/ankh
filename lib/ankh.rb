require 'rubygems'
require 'active_record'
require 'digest/sha1'
require 'configatron'

require 'ankh/rails/legacy'

module Ankh
  def self.salt=(salt)
    configatron.ankh.salt = salt
  end

  def self.salt
    configatron.ankh.salt ||= 'fqphweuyir8y34295yu234y5219pthfsdlhgfsaf'
  end

  def self.encrypt(item_to_encrypt)
    Digest::SHA1.hexdigest("--#{salt}--#{item_to_encrypt}")
  end

  mattr_accessor :available_factories
  def self.register_factory(factory_sym, factory_class)
    self.available_factories ||= ActiveSupport::OrderedHash.new({})
    self.available_factories[factory_sym] = factory_class
  end

  def self.remove_factory(factory_sym)
    self.available_factories.delete(factory_sym)
  end

  def self.random_factory
    keys = self.available_factories.keys
    random_key = keys[rand(keys.size)]
    self.available_factories[random_key]
  end
end

require 'ankh/question_factory/constant_sequence'

require 'ankh/question_factory/simple_math'
require 'ankh/question_factory/month_sequence'
require 'ankh/question_factory/day_sequence'

require 'ankh/question'
require 'ankh/validations/human'

require 'ankh/model'
