class AddLevelIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :level_id, :integer
  end
end
