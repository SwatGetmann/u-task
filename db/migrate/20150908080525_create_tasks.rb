class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.string :category
      t.integer :level
      t.float :rating

      t.timestamps null: false
    end
  end
end
