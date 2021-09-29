class CreateTimeSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :time_slots do |t|
      t.references :appointment, null: false, foreign_key: true
      t.date :day_booked
      t.integer :hours, array: true, default: []

      t.timestamps
    end
  end
end
