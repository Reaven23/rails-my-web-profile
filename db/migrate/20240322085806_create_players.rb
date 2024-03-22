class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.text :last_name
      t.string :birth_year
      t.string :level
      t.integer :points_record
      t.float :points_average
      t.string :photo

      t.timestamps
    end
  end
end
