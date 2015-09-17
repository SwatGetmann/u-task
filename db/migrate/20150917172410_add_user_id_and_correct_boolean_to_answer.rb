class AddUserIdAndCorrectBooleanToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :user_id, :integer
    add_column :answers, :correct, :boolean
  end
end
