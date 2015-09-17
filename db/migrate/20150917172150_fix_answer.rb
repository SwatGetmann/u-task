class FixAnswer < ActiveRecord::Migration
  def change
  	rename_column :answers, :context, :content
  end
end
