class Appointment < ApplicationRecord
  belongs_to :client, class_name: 'User'
  belongs_to :provider, class_name: 'User'
  belongs_to :service
  


  validates :start_day, :end_day, :start_hour, :end_hour, presence: true
   
end
