class WorkingHour < ApplicationRecord
  belongs_to :provider, class_name: 'User'
end
