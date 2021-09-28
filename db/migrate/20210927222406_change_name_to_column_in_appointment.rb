class ChangeNameToColumnInAppointment < ActiveRecord::Migration[6.1]
  def change
    rename_column(:appointments, :user_id, :client_id)
  end
end
