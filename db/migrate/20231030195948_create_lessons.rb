class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :type
      t.integer :price
      t.integer :duration

      t.timestamps
    end
  end
end
