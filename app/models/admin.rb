class Admin < User
  after_initialize :set_default_role, :if => :new_record?
  

  def self.all
    User.where(role: :admin).all
  end

  private

  def set_default_role
    self.role = :admin
  end

end
