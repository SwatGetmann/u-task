class AddAnswerToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :answer, :string
  end
end
