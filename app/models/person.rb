class Person < ActiveRecord::Base
  has_many :calls
  has_many :call_comments
  belongs_to :client
  has_one :user, :dependent => :destroy
  has_many :assignments
  has_many :clients, :through => :assignments
  
  def get_full_name
    fname + " " + lname
  end
  
  def self.is_internal?(user)
    Person.find(user.person_id).client_id == Client.where("name = 'Model N, Inc.'").first.id
  end
  
  def self.get_internal
    Person.where(client_id: Client.where("name = 'Model N, Inc.'").first.id).all
  end
    
end
