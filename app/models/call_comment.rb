class CallComment < ActiveRecord::Base
  belongs_to :call
  belongs_to :author, :class_name => "Person"
  
  scope :external, where(:internal => false)
end
