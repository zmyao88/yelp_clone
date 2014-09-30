class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :restaurants, :cusisine, :cuisine
  end
end
