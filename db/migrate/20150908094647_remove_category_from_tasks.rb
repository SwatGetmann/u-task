class RemoveCategoryFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :category, :string
  end
end
