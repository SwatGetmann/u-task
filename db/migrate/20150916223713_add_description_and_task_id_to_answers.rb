class AddDescriptionAndTaskIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :description, :string
    add_column :answers, :task_id, :integer
  end
end
