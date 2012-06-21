class Enum < ActiveRecord::Base
  scope :statuses, where(enum_type: 'status')
  scope :priorities, where(enum_type: 'priority')
  scope :severities, where(enum_type: 'severity')
  scope :areas, where(enum_type: 'area')
  scope :releases, where(enum_type: 'release')
  scope :systems, where(enum_type: 'system')
end
