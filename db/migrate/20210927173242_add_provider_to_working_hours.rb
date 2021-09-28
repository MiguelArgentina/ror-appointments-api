class AddProviderToWorkingHours < ActiveRecord::Migration[6.1]
  def change
    add_reference :working_hours, :provider, null: false, foreign_key: { to_table: :users }
  end
end
