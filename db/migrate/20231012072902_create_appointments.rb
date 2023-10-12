class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :day
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
