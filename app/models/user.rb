class User < ApplicationRecord
  has_many :clients_providers, foreign_key: :provider_id, class_name: 'Appointment'
  has_many :clients, through: :clients_providers

  has_many :clients_provided, foreign_key: :client_id, class_name: 'Appointment'
  has_many :providers, through: :clients_provided

  has_many :provider_services, foreign_key: :service_id, class_name: 'Appointment'
  has_many :clients, through: :provider_services
  
  has_many :working_hours, foreign_key: :provider_id
  
  enum role: [:client, :provider, :admin]
  after_initialize :set_default_role, :if => :new_record?

  devise :database_authenticatable,
          :jwt_authenticatable,
          :registerable,
          jwt_revocation_strategy: JwtDenylist
  
  

  private

  def set_default_role
    self.role ||= :client
  end

end
