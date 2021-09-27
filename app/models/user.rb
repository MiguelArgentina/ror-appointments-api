class User < ApplicationRecord
  enum role: [:user, :provider, :admin]
  after_initialize :set_default_role, :if => :new_record?

  devise :database_authenticatable,
          :jwt_authenticatable,
          :registerable,
          jwt_revocation_strategy: JwtDenylist

  private

  def set_default_role
    self.role ||= :user
  end

end
