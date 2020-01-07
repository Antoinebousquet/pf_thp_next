class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.datetime :date
      t.integer :hours_of_sleep
      t.integer :mood
      t.integer :treatment

      t.timestamps
    end
  end
end
