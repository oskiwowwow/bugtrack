class Call < ActiveRecord::Base
  belongs_to :author, :class_name => "Person"
  belongs_to :assignee, :class_name => "Person"
  belongs_to :client
  belongs_to :contact, :class_name => "Person"
  belongs_to :status, :class_name => "Enum", conditions: "enum_type = 'status'"
  belongs_to :priority, :class_name => "Enum", conditions: "enum_type = 'priority'"
  belongs_to :severity, :class_name => "Enum", conditions: "enum_type = 'severity'"
  belongs_to :area, :class_name => "Enum", conditions: "enum_type = 'area'"
  belongs_to :release_found, :class_name => "Enum", conditions: "enum_type = 'release'",
    :foreign_key => 'release_found_id'
  belongs_to :release_resolved, :class_name => "Enum", conditions: "enum_type = 'release'",
    :foreign_key => 'release_resolved_id'
  belongs_to :system, :class_name => "Enum", conditions: "enum_type = 'system'"
  has_many :call_comments, :dependent => :destroy
end