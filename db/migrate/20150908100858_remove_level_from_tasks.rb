class RemoveLevelFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :level, :integer
  end
end
