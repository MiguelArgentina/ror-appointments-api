class CreateWorkingHours < ActiveRecord::Migration[6.1]
  def change
    create_table :working_hours do |t|
      t.datetime :start_hour
      t.datetime :end_hour

      t.timestamps
    end
  end
end
