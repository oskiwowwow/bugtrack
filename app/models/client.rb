class Client < ActiveRecord::Base
  has_many :people
  has_many :calls
  has_many :assignments
  has_many :people, :through => :assignments
end
