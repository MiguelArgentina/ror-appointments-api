class CreateWorkingHours < ActiveRecord::Migration[6.1]
  def change
    create_table :working_hours do |t|
      t.integer :start_hour
      t.integer :end_hour

      t.timestamps
    end
  end
end
