class AddValueToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :value, :integer
  end
end
