require "rubygems"
require "active_record"
require "digest/sha1"
require "configatron"

require "ankh/rails/legacy"

require "ankh/question"
require "ankh/validations/human"

require "ankh/model"

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
end