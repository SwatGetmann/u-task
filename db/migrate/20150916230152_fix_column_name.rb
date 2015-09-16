class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :answers, :description, :context
  end
end
