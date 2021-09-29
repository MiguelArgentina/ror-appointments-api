class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :provider, null: false, foreign_key: { to_table: :users }
      t.references :service, null: false, foreign_key: { to_table: :services }
      t.date :start_day
      t.date :end_day
      t.integer :start_hour
      t.integer :end_hour

      t.timestamps
    end
  end
end
